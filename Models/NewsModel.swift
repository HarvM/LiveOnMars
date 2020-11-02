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
    var urlMain = "https://newsapi.org/v2/everything?q=NASA&apiKey=NADA&language=en&page="
    var nextPageToLoad = 1
    var currentlyLoading = false
    var doneLoading = false
    
    ///Will ensure that when the user reaches the end of the page, the app will fetch the next page of news
    func shouldLoadMoreData(currentItem: NewsListItem? = nil) -> Bool {
        if currentlyLoading || doneLoading {
            return false
        }
        ///Optional unwrapping - so if there is an item being handled then true
        guard let currentItem = currentItem else {
            return true
        }
        
        ///When the user reaches the last 4 items or less then the new page of news will be laoded
        for n in (newsListItems.count - 4)...(newsListItems.count-1) {
            if n >= 0 && currentItem.uuid == newsListItems[n].uuid {
                return true
            }
        }
        return false
    }
    
    //LOOK INTO MORE AND LEARN
    ///Will get the position of the user in the newsListItems array
    subscript(position: Int) -> NewsListItem {
        return newsListItems[position]
    }
    
    ///
    init() {
        loadMoreArticles()
    }
    
    ///Will load the articles with URLSession from the API and also prepare the next page to be loaded
    func loadMoreArticles(currentItem: NewsListItem? = nil) {
        
        ///If no need to load more data then short circuit
        if !shouldLoadMoreData(currentItem: currentItem) {
            return
        }
        currentlyLoading = true
                
        let urlString = ("\(urlMain)\(nextPageToLoad)")
        let url = URL(string: urlString)!
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
            currentlyLoading = false

            return
        }
        
        guard let data = data else {
            print("No data cap'n")
            currentlyLoading = false
            return
        }
        ///The main thread will add the new articles gained from the parseArcticlesFromData func
        ///Will also increment the pageNumber once the first once has been loaded to ensure next page loads
        ///If valid JSON returned then but no articles then doneLoading more data in
        let newArticles = parseArticlesFromData(data: data)
        DispatchQueue.main.async {
            self.newsListItems.append(contentsOf: newArticles)
            self.nextPageToLoad += 1
            self.currentlyLoading = false
            self.doneLoading = (newArticles.count == 0)

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

