//
//  NewsView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 09/09/2020.
//

import SwiftUI
import Alamofire

struct NewsView: View {
    
    //MARK: - Properties
    @ObservedObject var newsFeed = NewsFeed()
    
    //MARK: - View
    var body: some View {
        List(newsFeed) {
            (article: NewsListItem) in
            NewsItemView(article: article)
                .onAppear {
                    self.newsFeed.loadMoreArticles(currentItem: article)
                }
        }
    }
}

struct NewsItemView: View {
    var article: NewsListItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(article.title)")
                .font(.headline)
            Text("\(article.author)")
                .font(.subheadline)
        }
        .padding()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
