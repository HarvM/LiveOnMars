//
//  URLImageView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 02/11/2020.
//

import SwiftUI

struct URLImageView: View {
    
    //MARK: - Properties
    @ObservedObject var imageModel: ImageModel
    
    init(urlString: String?) {
        imageModel = ImageModel(urlString: urlString)
    }
    
    //MARK: - Body of the View
    var body: some View {
        ///Will either display the image pulled from the JSON or display the placeholder image should the article not have one
        Image(uiImage: imageModel.finalImage ?? URLImageView.placeholderNews!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .padding(5)
    }
     static var placeholderNews = UIImage(named:"newsPlaceholder")
}
