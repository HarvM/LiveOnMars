//
//  NetworkManager.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 11/09/2020.
//

import Combine
import Foundation

class NetworkManager {
    
    //MARK: - Error Handling
    
    enum Error: LocalizedError {
        case invalidResponse
        case addressUnreachable(URL)
        
        ///Will give useful feedback about the error that's happening
        var errorDescription: String? {
            switch self {
            case .invalidResponse:
                return "Nothing useful here from the space lads and their server"
            case .addressUnreachable(let url):
                return "\(url.absoluteString) is currently unreachable"
            }
        }
    }
    
    //MARK: - Adding URL
    let urlRequest = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&camera=fhaz&api_key=DEMO_KEY")!
    
    ///Networking is then placed on concurrent queue
    let networkQueue = DispatchQueue(label: "Networking",
                                     qos: .default,
                                     attributes: .concurrent)
    
    ///Combine network call
    func downloadPhotos() -> AnyPublisher<Photo, Error> {
        URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .receive(on: networkQueue)
            .map(\.data)
            .decode(type: User.self, decoder: JSONDecoder())
            .mapError { (error) -> NetworkManager.Error in
                switch error {
                case is URLError:
                    return Error.addressUnreachable(self.urlRequest)
                default:
                    return Error.invalidResponse
                }
            }
    }
}
