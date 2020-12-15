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
    
    //Body of the view
    var body: some View {
        NavigationView {
            List {
                ForEach (newsFeed, id: \.uuid) {
                    article in
                    VStack {
                        NewsItemView(article:article)
                            .onAppear {
                                self.newsFeed.loadMoreArticles(currentItem: article)
                            }
                        NavigationLink("", destination: ArticleView(articleToBeDisplayed: article))
                    }
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
