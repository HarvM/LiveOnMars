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
    @ObservedObject var getData = TranquilityBaseDataModel()
    
    //MARK: - Body of View
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack {
                    List {
                        ///ImageDayView with load in singular image from API
                        ImageOfDayView()
                            .padding(.leading, -16)
                            .padding(.trailing, -16)
                        Spacer()
                        ///Section that displays the first call from the API
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach (getData.jsonData) { i in
                                    DisplayMarsView(imgSrc: i.imgSrc!, earthDate: i.earthDate!, sol: i.sol!)
                                } 
                            } 
                        }
                        .padding(.leading, -16)
                        .padding(.trailing, -16)
                    }
                    .listStyle(PlainListStyle())
                    ///Ensures that the list is closer to the top of the window
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

