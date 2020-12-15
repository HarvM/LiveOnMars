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
                    .font(.headline)
                    .padding(2)
                Text("\(article.author ?? "No author found")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

//struct NewsItemView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewsItemView(article: NewsListItem)
//    }
//}
