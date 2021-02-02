//
//  ImageOfDayView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 02/02/2021.
//

import SwiftUI
import SDWebImageSwiftUI

//View that sits on the PhotoView that displays the singular photo from the Photo Of The Day API
struct ImageOfDayView: View {
    
    @ObservedObject var image = ImageOfTheDay()
    
   
    var body: some View {
        VStack {
            HStack {
            Text("Image Of The Day")
                .font(.largeTitle)
                .foregroundColor(.red)
            }
            ///Load in the image from the networking
            if image.dataHasBeenLoaded {
                Image(uiImage: image.imageOfDay!)
                    ///Basic modifiers to ensure that the image is displayed correctly
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct ImageOfDayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageOfDayView()
    }
}
