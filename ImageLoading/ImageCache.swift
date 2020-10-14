//
//  ImageCache.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 10/09/2020.
//

import UIKit

protocol ImageCache {
    subscript(url: URL) -> UIImage? {get set}
}

struct TemporaryImageCache: ImageCache {
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
}
