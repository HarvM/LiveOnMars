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
    
    //MARK: - Properties
    @ObservedObject var getData = MarsDataModel()
    
    //MARK: - Body of View
    var body: some View {
        NavigationView {
            List(getData.jsonData) { i in
                DisplayPhotoView(imgSrc: i.imgSrc!)
            } .navigationBarTitle("Live on Mars")
        }
    }
    
    
    struct PhotoView_Previews: PreviewProvider {
        static var previews: some View {
            PhotoView()
        }
    }
}
