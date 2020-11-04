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
    
    var body: some View {
        Image(uiImage: imageModel.finalImage ?? URLImageView.placeholderNews!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
     static var placeholderNews = UIImage(named:"newsPlaceholder")
}

//struct URLImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        URLImageView(urlString: article.urlString)
//    }
//}
