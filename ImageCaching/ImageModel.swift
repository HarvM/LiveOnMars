//
//  ImageModel.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 04/11/2020.
//

import SwiftUI

///Will take the URL string and ensure that there is one
class ImageModel: ObservableObject {
    
    //MARK: Properties
    @Published var finalImage: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    ///If the image has been already loaded and cached, it will be pulled from the cache
    ///Else it will be pulled from the API
    func loadImage() {
        if loadImageFromCache() {
            return
        }
        loadImageFromURL()
    }
    
    ///Will determine if the image is to be loaded from the cache or not. If not then it will go to the loadImage func above
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        finalImage = cacheImage
        return true
    }
    
    ///Gets the URL and places it within the URLSession to get the data from it
    func loadImageFromURL() {
        guard let urlString = urlString else {
            return
        }
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromJSONResponse(data:response:error:))
        task.resume()
    }
    
    func getImageFromJSONResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        
        guard let data = data else {
            print("No image data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            ///Assigning the image to the cache
            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            self.finalImage = loadedImage
        }
    }
}
