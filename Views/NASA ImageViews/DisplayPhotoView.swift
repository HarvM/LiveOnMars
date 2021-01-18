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
        VStack(spacing: 10) {
            ///Super basic right now but will look into getting this into a LazyVGrid shortly
            AnimatedImage(url: URL(string: imgSrc))
                .resizable()
                .indicator(SDWebImageActivityIndicator.medium)
                .scaledToFit()
                .frame(width: 350, height: 200, alignment: .center)
                
//                .clipShape(Circle())
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
