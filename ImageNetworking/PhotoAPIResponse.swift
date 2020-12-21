//
//  PhotoAPIResponse.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 17/12/2020.
//

import Foundation

class PhotoAPIResponse: Codable {
    var status: String
    var articles: [Photo]?
}
