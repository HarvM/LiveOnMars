//
//  ImageDayView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 23/01/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageDayView: View {
    
    var hdurl: String
    var explanation: String
    var title: String
    
    var body: some View {
        AnimatedImage(url: URL(string: hdurl))
            .resizable()
            .indicator(SDWebImageActivityIndicator.medium)
            .frame(width: 150, height: 150, alignment: .leading)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.red, lineWidth: 0.5))
        
        Text("\(explanation)")
        Text("\(title)")
    }
}

//struct ImageDayView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageDayView()
//    }
//}
