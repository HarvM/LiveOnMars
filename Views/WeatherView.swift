//
//  WeatherView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 09/09/2020.
//

import SwiftUI

///Array that will hold the weather data
//@State public var weatherData = [WeatherData]()

struct WeatherView: View {
  
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

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
