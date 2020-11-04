//
//  NewsAPIResponse.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 04/11/2020.
//

import SwiftUI

class NewsAPIResponse: Codable {
    var status: String
    var articles: [NewsListItem]?
}
