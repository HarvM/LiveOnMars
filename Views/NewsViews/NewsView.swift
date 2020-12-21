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
    
    //MARK: - Body of the view
    var body: some View {
        NavigationView {
            List {
                ForEach (newsFeed, id: \.uuid) {
                    article in
                    HStack {
                        NewsItemView(article:article)
                            .onAppear {
                                DispatchQueue.main.async {
                                self.newsFeed.loadMoreArticles(currentItem: article)
                                }
                            }
                        NavigationLink("", destination: ArticleView(articleToBeDisplayed: article))
                    }
                    .clipped()
                    .frame(minWidth: 700, idealWidth: 780, maxWidth: 800, minHeight: 50, idealHeight: 65, maxHeight: 85, alignment: .leading)
                    .padding(15)
                    
                } .navigationTitle("NASA News")
                .font(.headline)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
