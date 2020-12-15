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
    
    var body: some View {
        VStack{
        Text("\(articleToBeDisplayed.author ?? "nothing")")
        Text("\(articleToBeDisplayed.articleDescription ?? "nothing")")
    }
    }
}

//struct ArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleView()
//    }
//}
