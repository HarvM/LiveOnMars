//
//  PhotoView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 09/09/2020.
//

import SwiftUI

///DEMO URL: https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=DEMO_KEY


let posters = [
    "https://image.tmdb.org/t/p/original//pThyQovXQrw2m0s9x82twj48Jq4.jpg",
    "https://image.tmdb.org/t/p/original//vqzNJRH4YyquRiWxCCOH0aXggHI.jpg",
    "https://image.tmdb.org/t/p/original//6ApDtO7xaWAfPqfi2IARXIzj8QS.jpg",
    "https://image.tmdb.org/t/p/original//7GsM4mtM0worCtIVeiQt28HieeN.jpg"
].map { URL(string: $0)! }

//MARK: - PhotoView Struct
struct PhotoView: View {
    
    @Environment(\.imageCache) var cache: ImageCache

     var body: some View {
          List(posters, id: \.self) { url in
              AsyncImage(
                 url: url,
                 cache: self.cache,
                 placeholder: Text("Loading ..."),
                 configuration: { $0.resizable() }
              )
             .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3) // 2:3 aspect ratio
          }
     }
 }


struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
