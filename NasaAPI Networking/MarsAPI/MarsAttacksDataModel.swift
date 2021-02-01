//
//  MarsAttacksDataModel.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 21/01/2021.
//

import Foundation
import SwiftUI

class MarsAttacksModel: ObservableObject {
    
    //MARK: - Properties
    @Published var jsonDataAck = [Photo]()
    let url: String = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2020-7-28&api_key=w4t0C9ceRCXNuCsUbPEqlR8GH5Lce8ghpVXlpZZo"
    
    init () {
        let session = URLSession(configuration: .default) ///Create session
        ///Using the demo URL for the time being
        ///Parse in URL
        session.dataTask(with: URL(string: url)!) {
            (data, _, _) in
            do {
                ///Decode the URL using the Welcome.swift model & then main thread since it's a UI component
                let fetch = try JSONDecoder().decode(Welcome.self, from: data!)
                DispatchQueue.main.async {
                    //NOTE: Issue was around here and not taking into consideration the nesting of the JSON
                    self.jsonDataAck = fetch.photos!
                }
            }
            catch {
                ///Error handling for both user and myself
                Alert(title: Text("Sorry"), message: Text("There's been an issue getting the data from NASA - kinda cool"), dismissButton: .default(Text("Okay")))
                print(error)
            }
        } .resume()
    }
}
