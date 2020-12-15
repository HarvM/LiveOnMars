//
//  NewsListItem.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 04/11/2020.
//

import SwiftUI

class NewsListItem: Identifiable, Codable {
    
    var uuid = UUID()
    var source: Source?
    var author: String?
    var title: String
    var urlToImage: String?
    var url: String
    var name: String?
    var articleDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case author, title, urlToImage, url, name
        case articleDescription = "description"
    }
}

class Source {
    var id: String?
    var name: String?

    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
}
