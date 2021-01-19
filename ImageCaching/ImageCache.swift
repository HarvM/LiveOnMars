//
//  ImageCache.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 04/11/2020.
//

import SwiftUI

//Cache built for the NewsView and specificially the images held for each of the articles
class ImageCache {
    
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
