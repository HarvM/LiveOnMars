//
//  DisplayPhotoView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 17/01/2021.
//

import SwiftUI
import SDWebImageSwiftUI

///View is displayed within the PhotoView
struct DisplayMarsView: View {
    
    //MARK: - Properties
    var imgSrc: String
    var earthDate: String
    var sol: Int
    
    //MARK: - Body of the view
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                ///Use of AnimatedImage from SDWebImageSwiftUI
                AnimatedImage(url: URL(string: imgSrc))
                    .resizable()
                    .indicator(SDWebImageActivityIndicator.medium)
                    .frame(width: 130, height: 130, alignment: .leading)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.red, lineWidth: 0.5))
                VStack{
                    Text("Date: \(earthDate)")
                        .font(.footnote)
                    Text("Sol date: \(sol)")
                        .font(.footnote)
                }
            }
        }  
    }  
}

//struct DisplayPhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DisplayPhotoView()
//    }
//}
