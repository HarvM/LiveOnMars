//
//  NewsItemView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 07/12/2020.
//

import SwiftUI

struct NewsItemView: View {
    
    //MARK: - Properties
    var article: NewsListItem
    var description: String = ""

    ///How each of the articles are displayed on the list
    var body: some View {
        HStack{
            URLImageView(urlString: article.urlToImage)
            VStack(alignment: .leading) {
                Text("\(article.title)")
                    .font(.subheadline)
                    .padding(2)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.9)
                    .lineLimit(2)
                Text("\(article.author ?? "No author found")")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(height: 400)
        }
    }
}

//struct NewsItemView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewsItemView(article: NewsListItem)
//    }
//}
