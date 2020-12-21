//
//  NASAImageView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 17/12/2020.
//

import SwiftUI

struct NASAImageView: View {
    
    //MARK: - Properties
    @ObservedObject var imageModel: ImageModel
    
    init(urlString: String?) {
        imageModel = ImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: imageModel.finalImage ?? URLImageView.placeholderNews!)
            .resizable()
            .scaledToFit()
            .frame(width: 400, height: 400)
            .padding(5)
    }
     static var placeholderNews = UIImage(named:"newsPlaceholder")
}
//
//struct NASAImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NASAImageView(urlString: <#String?#>)
//    }
//}
