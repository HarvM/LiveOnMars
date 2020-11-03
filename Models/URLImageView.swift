//
//  URLImageView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 02/11/2020.
//

import SwiftUI

enum PlaceholderImages: String {
    case placeholderNews = "newsPlaceholder"
}

struct URLImageView: View {
    var body: some View {
        Image(uiImage: URLImageView.placeholderNews!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
     static var placeholderNews = UIImage(named:"newsPlaceholder")
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView()
    }
}
