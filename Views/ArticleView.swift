//
//  ArticleView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 08/12/2020.
//

import SwiftUI


struct ArticleView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    let articleToBeDisplayed: NewsListItem
    //    let photoToBeDisplayed: ImageModel
    
    //    URLImageView(urlString: article.urlToImage)
    
    var body: some View {
        HStack{
            Text(" Article written by: \(articleToBeDisplayed.author ?? "nothing")")
        }
        VStack{
            //            Image("\(String(describing: articleToBeDisplayed))")
            Text("\(articleToBeDisplayed.articleDescription ?? "nothing")")
                .multilineTextAlignment(.center)
                .frame(minWidth: 400, idealWidth: 500, maxWidth: 525, minHeight: 600, idealHeight: 650, maxHeight: 700, alignment: .center)
        }
        .navigationTitle("\(articleToBeDisplayed.title )")
        .allowsTightening(true)
        .font(.footnote)
        .minimumScaleFactor(0.5)
    }
}

//struct ArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleView()
//    }
//}
