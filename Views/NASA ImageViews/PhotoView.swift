//
//  PhotoView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 09/09/2020.
//

import SwiftUI

//MARK: - PhotoView Struct
struct PhotoView: View {
    
    @ObservedObject var imageFeed = ImageFeed()
    
    var body: some View {
        NavigationView {
            List {
                ForEach (imageFeed, id: \.id) {
                    photoFeed in
                    VStack {
                        DisplayPhotosView(photoFeed: photoFeed)
                    }
                }
                .padding()
            }
        }
    }
    
    
    //    struct PhotoView_Previews: PreviewProvider {
    //        static var previews: some View {
    //            PhotoView(nasaImage: Photo)
    //        }
    //    }
    
}
