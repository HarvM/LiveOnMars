//
//  ImageOfTheDay.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 01/02/2021.
//

import Foundation
import SwiftUI


class ImageOfTheDay: ObservableObject {
    
    //MARK: - Properties
    @Published var imageOfDay: UIImage? = nil
    @Published var dataHasBeenLoaded: Bool = false
    
    init() {
        ///URL for the NASA API - can be used with the supplied DEMO_KEY for a limited number of requests
        loadJSON("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
    }
    
    //MARK: - Functions
    
    ///Will load in the url for JSON data
    func loadJSON(_ urlString: String) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        ///Loads in the URL of the JSON
        let task = URLSession.shared.dataTask(with: request) {
            ///Error catches
            (data,response,error) in
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            guard let content = data else {
                print("No data found - weird")
                return
            }
            ///Parses JSON data to Dictionary
            let json = try! JSONSerialization.jsonObject(with: content, options: [])
            let jsonObj = json as! [String: Any]
            self.loadImage(urlString: jsonObj["url"] as! String)
            print("Loaded")
        }
        .resume()
    }
    
    ///Willt take in the image from the supplied URL and then assign it to the Publsihed imageOfTheDay
    func loadImage(urlString: String) {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        
        ///Feeds in the URL and error catches should no data be found
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            guard let content = data else {
                print("No data found")
                return
            }
            ///Published imageOfDay is then given the image that has been loaded in above
            DispatchQueue.main.async {
                self.imageOfDay = UIImage(data: content)
                self.dataHasBeenLoaded = true
            }
            print("All set")
        }
        task.resume()
    }
}
