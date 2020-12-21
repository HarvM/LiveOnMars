//
//  WebViewWrapper.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 16/12/2020.
//

import WebKit
import SwiftUI

final class WebViewWrapper : UIViewRepresentable {
    
    //MARK: - Properties
    @ObservedObject var webViewStateModel: WebViewStateModel
    let action: ((_ navigationAction: WebView.NavigationAction) -> Void)?
    let request: URLRequest
    
    init(webViewStateModel: WebViewStateModel,
         action: ((_ navigationAction: WebView.NavigationAction) -> Void)?,
         request: URLRequest) {
        self.action = action
        self.request = request
        self.webViewStateModel = webViewStateModel
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        let view = WKWebView()
        view.navigationDelegate = context.coordinator
        view.load(request)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if uiView.canGoBack, webViewStateModel.goBack {
            uiView.goBack()
            webViewStateModel.goBack = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(action: action, webViewStateModel: webViewStateModel)
    }
    
    final class Coordinator: NSObject {
        @ObservedObject var webViewStateModel: WebViewStateModel
        let action: ((_ navigationAction: WebView.NavigationAction) -> Void)?
        
        init(action: ((_ navigationAction: WebView.NavigationAction) -> Void)?,
             webViewStateModel: WebViewStateModel) {
            self.action = action
            self.webViewStateModel = webViewStateModel
        }
    }
}

extension WebViewWrapper.Coordinator: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if action == nil {
            decisionHandler(.allow)
        } else {
            action?(.decidePolicy(navigationAction, decisionHandler))
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.webViewStateModel.loading = true
            self.action?(.didStartProvisionalNavigation(navigation))
        }
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        action?(.didReceiveServerRedirectForProvisionalNavigation(navigation))
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        DispatchQueue.main.async {
            self.webViewStateModel.loading = false
            self.webViewStateModel.canGoBack = webView.canGoBack
            self.action?(.didFailProvisionalNavigation(navigation, error))
        }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        action?(.didCommit(navigation))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.webViewStateModel.loading = false
            self.webViewStateModel.canGoBack = webView.canGoBack
            if let title = webView.title {
                self.webViewStateModel.pageTitle = title
            }
            self.action?(.didFinish(navigation))
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        DispatchQueue.main.async {
            self.webViewStateModel.loading = false
            self.webViewStateModel.canGoBack = webView.canGoBack
            self.action?(.didFail(navigation, error))
        }
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        DispatchQueue.main.async {
            if self.action == nil  {
                completionHandler(.performDefaultHandling, nil)
            } else {
                self.action?(.didRecieveAuthChallange(challenge, completionHandler))
            }
        }
    }
}
