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
            ///Will show the user the current weather and the weather from the past week too
            WeatherView()
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Current weather")
                }
        }
    }
}

//MARK: - PhotoView Struct
struct PhotoView: View {
    ///Temp array to ensure it's working
    var colours = [Color.green, Color.red, Color.black, Color.green, Color.purple]
    var body: some View {
        ///Vertical scrollView here that will let the user browse the images
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(self.colours, id: \.self) { colour in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(colour)
                        .frame(width: 300, height: 300)
                }
            }
        } .padding(.horizontal)
    }
}

//MARK: - WeatherView struct
struct WeatherView: View {
    ///Temp data to fill the List for the time being
    var body: some View {
        VStack {
            List {
                ///Some placeholder text - will sort how the list is displayed later
                Section (header: Text ("Current Weather on Mars")) {
                    Text("It's sunny")
                    Text("Why did we leave?")
                }
            } .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
