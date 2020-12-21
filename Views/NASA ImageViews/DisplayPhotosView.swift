//
//  DisplayPhotosView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 18/12/2020.
//

import SwiftUI

struct DisplayPhotosView: View {
    
    var photoFeed: Photo
    
    var body: some View {
        NASAImageView(urlString: photoFeed.imgSrc)
            .onAppear(perform: checkOutput)
        Text("\(photoFeed.earthDate ?? "hello there")")
    }
    func checkOutput() {
        print("This is \(String(describing: photoFeed.earthDate))")
    }
}



//        NASAImageView(urlString: article.imgSrc)



//struct DisplayPhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        DisplayPhotosView()
//    }
//}
