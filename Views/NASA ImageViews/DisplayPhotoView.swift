//
//  DisplayPhotoView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 17/01/2021.
//

import SwiftUI
import SDWebImageSwiftUI

///View is displayed within the PhotoView
struct DisplayPhotoView: View {
    
    //MARK: - Properties
    var imgSrc: String
    
    //MARK: - Body of the view
    var body: some View {
        VStack(alignment: .leading , spacing: 10) {
            ///Need to add caching here
            AnimatedImage(url: URL(string: imgSrc))
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            ///Need to adjust how the images are displayed - just to make it better looking
            ///Maybe add some details about the image too to give it some context
        }
    }
}

//struct DisplayPhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DisplayPhotoView()
//    }
//}
