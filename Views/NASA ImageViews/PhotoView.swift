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
    @ObservedObject var getMarsAttacksData = MarsAttacksModel()
    
    //MARK: - Body of View
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List {
                        ///ImageDayView with load in singular image from API
                        ImageOfDayView()
                        Section(header: Text("Demo")) {
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach (getData.jsonData) { i in
                                        DisplayMarsView(imgSrc: i.imgSrc!, earthDate: i.earthDate!, sol: i.sol!)
                                    }
                                    .background(Color.white)
                                }
                            }
                        }
                        Section(header: Text("Ack Ack")) {
                            ScrollView(.horizontal) {
                                HStack {
                            ForEach(getMarsAttacksData.jsonDataAck) { ack in
                                MarsAttacksView(imgSrc: ack.imgSrc!, earthDate: ack.earthDate!, sol: ack.sol!)
                            }
                            .background(Color.white)
                                }
                            }
                            }
                    }
                }
            }
            .background(Color.white)
        }
        .background(Color.white)
    }
    
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

