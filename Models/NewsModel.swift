//
//  FeedModel.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 31/10/2020.
//

import Foundation

///Random access collection:
class NewsFeed: ObservableObject, RandomAccessCollection {
    
    
    
    //MARK: - Properties
    typealias Element = NewsListItem
    @Published var newsListItems = [NewsListItem]()
    var startIndex: Int {newsListItems.startIndex}
    var endIndex: Int {newsListItems.endIndex}
    var urlMain = "http://newsapi.org/v2/everything?q=Mars&from=2020-10-31&sortBy=popularity&apiKey=PWOPA_NAWTY"
    
    //LOOK INTO MORE AND LEARN
    ///Will get the position of the user in the newsListItems array
    subscript(position: Int) -> NewsListItem {
        return newsListItems[position]
    }
    
    ///
    init() {
        loadArticles()
    }
    
    ///Will load the articles with URLSession from the API
    func loadArticles() {
        let url = URL(string: urlMain)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: parseArticlesFromResponse(data:response:error:))
        task.resume()
    }
    
    func parseArticlesFromData(data: Data) -> [NewsListItem] {
        let jsonObject = try! JSONSerialization.jsonObject(with: data)
        let topLevelMap = jsonObject as! [String: Any]
        
        ///Checks the status of the API to ensure it is valid
        guard topLevelMap["status"] as? String == "ok" else {
            print("Bad status return")
            return []
        }
        ///Gets an array of articles and notifies if nothing is returned
        guard let jsonArticles = topLevelMap["articles"] as? [[String: Any]] else {
            print("Nothing found")
            return []
        }
        
        ///Grabs the title and author from the JSON
        var newArticles = [NewsListItem]()
        for jsonArticle in jsonArticles {
            guard let title = jsonArticle["title"] as? String else {
                continue
            }
            guard let author = jsonArticle["author"] as? String else {
                continue
            }
            ///Both items above are then added to the newArticles
            newArticles.append(NewsListItem(title: title, author: author))
        }
        return newArticles
    }
    
    ///Will parse the JSON
    func parseArticlesFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        
        guard let data = data else {
            print("No data cap'n")
            return
        }
        ///The main thread will add the new articles gained from the parseArcticlesFromData func
        let newArticles = parseArticlesFromData(data: data)
        DispatchQueue.main.async {
            self.newsListItems.append(contentsOf: newArticles)
        }
        
    }
}
    
    class NewsListItem: Identifiable, Codable {
        
        //MARK: - Properties
        var uuid = UUID()
        var author: String
        var title: String
        
        init(title: String, author: String) {
            self.title = title
            self.author = author
        }
    }

