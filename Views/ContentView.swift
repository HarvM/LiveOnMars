//
//  ContentView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 08/09/2020.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        ///TabView Setup
        TabView {
            ///Tab will take the user to the display of the recent photos taken from Mars
            PhotoView()
                .tabItem {
                    Image(systemName: "photo.fill")
                    Text("Photos")
                }
            ///Will show the user relevant news about Mars
            NewsView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Updates")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
