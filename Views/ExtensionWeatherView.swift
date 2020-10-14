//
//  ExtensionWeatherView.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 09/09/2020.
//

import SwiftUI

extension WeatherView {
    
    //api.nasa.gov/insight_weather/?api_key=DEMO_KEY&feedtype=json&ver=1.0  < demo URL
    
//    func loadData() {
//        guard let url = URL(string: "//api.nasa.gov/insight_weather/?api_key=DEMO_KEY&feedtype=json&ver=1.0")
//        else {
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            if let data = data {
//                if let response_obj = try?
//                    JSONDecoder.decode([WeatherData].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.weatherData = response_obj
//                    }
//                }
//            }
//        } .resume()
//    }
//}


struct ExtensionWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
}

struct ExtensionWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
