//
//  ContentView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 08/09/2020.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var
    var body: some View {
        ///TabView Setup
        TabView {
            ///Tab will take the user to the display of the recent photos taken from Mars
            PhotoView()
                .tabItem {
                    Image(systemName: "photo.fill")
                    Text("Photos")
                }
            ///Will show the user the current weather and the weather from the past week too
            WeatherView()
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Current weather")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
