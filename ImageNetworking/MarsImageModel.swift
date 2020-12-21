//
//  MarsImageModel.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 07/12/2020.
//

import SwiftUI

class ImageFeed: ObservableObject, RandomAccessCollection {
    
    //MARK: - Properties
    typealias Element = Photo
    @Published var photoItems = [Photo]()
    var startIndex: Int {photoItems.startIndex}
    var endIndex: Int {photoItems.endIndex}
    var urlMain = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=2&api_key=DEMO_KEY"
    var currentlyLoading = false
    var doneLoading = false
    var loadStatus = LoadStatus.ready(nextPage: 1)
    
    init() {
        loadMoreArticles()
    }
    
    //LOOK INTO MORE AND LEARN
    ///Will get the position of the user in the newsListItems array
    subscript(position: Int) -> Photo {
        return photoItems[position]
    }
    
    ///Will load the articles with URLSession from the API and also prepare the next page to be loaded
    func loadMoreArticles(currentItem: Photo? = nil) {
        
        ///If no need to load more data then short circuit
        if !shouldLoadMoreData(currentItem: currentItem) {
            return
        }
        guard case let .ready(page) = loadStatus else {
            return
        }
        loadStatus = .loading(page: page)
        let urlString = "\(urlMain)\(page)"
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: parseArticlesFromResponse(data:response:error:))
        task.resume()
    }
    
    
    ///Will ensure that when the user reaches the end of the page, the app will fetch the next page of news
    func shouldLoadMoreData(currentItem: Photo? = nil) -> Bool {
        ///Optional unwrapping - so if there is an item being handled then true
        guard let currentItem = currentItem else {
            return true
        }
        ///Ensure that when the user reaches the last 6 items or less, the next page will load
        for n in (photoItems.count - 6)...(photoItems.count-1) {
            if n >= 0 && currentItem.id == photoItems[n].id {
                return true
            }
        }
        return false
    }
    
    ///Will parse the JSON and will throw errors if anything unusual occuers
    func parseArticlesFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        ///If no error then bypass. Error displayed and change of loadStatus to prevent loading
        guard error == nil else {
            print("Error: \(error!)")
            loadStatus = .parseError
            return
        }
        ///If data exists then bypass. Error displayed if not and loadStatus changed to prevent loading
        guard let data = data else {
            print("No data found")
            loadStatus = .parseError
            return
        }
        
        ///The main thread will add the new articles gained from the parseArcticlesFromData func
        ///Will also increment the pageNumber once the first once has been loaded to ensure next page loads
        ///If valid JSON returned then but no articles then doneLoading more data in
        let newArticles = parseArticlesFromData(data: data)
        DispatchQueue.main.async {
            self.photoItems.append(contentsOf: newArticles)
            if newArticles.count == 0 {
                self.loadStatus = .done
            } else {
                guard case let .loading(page) = self.loadStatus else {
                    fatalError("Issue with loadStatus and loading new pages")
                }
                self.loadStatus = .ready(nextPage: page + 1)
            }
        }
    }
    
    ///Parses the different articles from the API
    func parseArticlesFromData(data: Data) -> [Photo] {
        var response: PhotoAPIResponse
        do {
            ///Decodes the response through the NewsAPIResponse class
            response = try JSONDecoder().decode(PhotoAPIResponse.self, from: data)
        } catch {
            print("Parsing error: \(error)")
            return []
        }
        ///If there's an issue with the API (url/service issue) then it will be caught here
        if response.status != "ok" {
            print("Status issue: \(response.status)")
            return []
        }
        ///Returns the articles from the URL else an  empty array
        return response.articles ?? []
    }
    
    ///Enum for the different states when loading/not loading and if there's an issue with parsing the JSON
    enum LoadStatus {
        case ready (nextPage: Int)
        case loading (page: Int)
        case parseError
        case done
    }
}
