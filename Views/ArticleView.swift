//
//  ArticleView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 08/12/2020.
//

import SwiftUI


struct ArticleView: View {
    
    //MARK: - Properties
    @ObservedObject var webViewStateModel: WebViewStateModel = WebViewStateModel()
    let articleToBeDisplayed: NewsListItem
    
    //MARK: Body of the view
    var body: some View {
        VStack{
            ///WebView that displays the corresponding aricle that the user has clicked on
            WebView(url: URL.init(string: "\(articleToBeDisplayed.url)")!, webViewStateModel: self.webViewStateModel)
        }
    }
}

//struct ArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleView()
//    }
//}
