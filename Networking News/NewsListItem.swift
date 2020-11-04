//
//  NewsListItem.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 04/11/2020.
//

import SwiftUI

class NewsListItem: Identifiable, Codable {
    var uuid = UUID()
    
    var author: String?
    var title: String
    var urlToImage: String?
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case author, title, urlToImage, url
    }
}
