//
//  PhotoView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 09/09/2020.
//

import SwiftUI
import SDWebImageSwiftUI

//Main view for displaying the JSON pulled from the NASA API
struct PhotoView: View {
    
    ///Nasa image for later use
    enum PlaceholderPhoto: String {
        case nasaLogo = "nasaLogo"
    }
    
    //MARK: - Properties
    @ObservedObject var getData = MarsDataModel()
    
    //MARK: - Body of View
    var body: some View {
        NavigationView {
            List(getData.jsonData) { i in
                DisplayPhotoView(imgSrc: i.imgSrc!, earthDate: i.earthDate!, sol: i.sol!)
            } .navigationBarTitle("Live on Mars")
            .listStyle(PlainListStyle())
        }
    }
    
    struct PhotoView_Previews: PreviewProvider {
        static var previews: some View {
            PhotoView()
        }
    }
}
