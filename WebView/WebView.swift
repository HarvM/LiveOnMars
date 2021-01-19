//
//  WebView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 16/12/2020.
//

import SwiftUI
import WebKit

///The view itself that displays the WebPage. Is called in ArticleView
struct WebView: View {
    
    //MARK: - Enum
    enum NavigationAction {
        case decidePolicy(WKNavigationAction,  (WKNavigationActionPolicy) -> Void)
        case didRecieveAuthChallange(URLAuthenticationChallenge, (URLSession.AuthChallengeDisposition, URLCredential?) -> Void)
        case didStartProvisionalNavigation(WKNavigation)
        case didReceiveServerRedirectForProvisionalNavigation(WKNavigation)
        case didCommit(WKNavigation)
        case didFinish(WKNavigation)
        case didFailProvisionalNavigation(WKNavigation,Error)
        case didFail(WKNavigation,Error)
    }
    
    //MARK: - Properties
    @ObservedObject var webViewStateModel: WebViewStateModel
    private var actionDelegate: ((_ navigationAction: WebView.NavigationAction) -> Void)?
    let urlRequest: URLRequest
    
    //MARK: - Body of the view
    var body: some View {
        WebViewWrapper(webViewStateModel: webViewStateModel, action: actionDelegate, request: urlRequest)
    }
    
    init(urlRequest: URLRequest, webViewStateModel: WebViewStateModel, onNavigationAction: ((_ navigationAction: WebView.NavigationAction) -> Void)?) {
        self.urlRequest = urlRequest
        self.webViewStateModel = webViewStateModel
        self.actionDelegate = onNavigationAction
    }
    
    init(url: URL, webViewStateModel: WebViewStateModel, onNavigationAction: ((_ navigationAction: WebView.NavigationAction) -> Void)? = nil) {
        self.init(urlRequest: URLRequest(url: url),
                  webViewStateModel: webViewStateModel,
                  onNavigationAction: onNavigationAction)
    }
}
