//
//  MarsDataModel.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 17/01/2021.
//

import Foundation

///Data Model that the DisplayPhotoView and PhotoView use to process the JSON
class MarsDataModel: ObservableObject {
    
    //MARK: - Properties
    @Published var jsonData = [Photo]()
    
    init () {
        let session = URLSession(configuration: .default)
        ///Using the demo URL for the time being
        session.dataTask(with: URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=2&api_key=DEMO_KEY")!) {
            (data, _, _)
            in
            do {
                let fetch = try JSONDecoder().decode(Welcome.self, from: data!)
                DispatchQueue.main.async {
                    //NOTE: Issue was around here and not taking into consideration the nesting of the JSON 
                    self.jsonData = fetch.photos!
                }
            }
            catch {
                print(error)
            }
        } .resume()
    }
}
