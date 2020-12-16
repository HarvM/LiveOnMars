//
//  WebViewStateModel.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 16/12/2020.
//

import Foundation

class WebViewStateModel: ObservableObject {
    ///The three Bool states
    @Published var pageTitle: String = "Web View"
    @Published var loading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var goBack: Bool = false
}
