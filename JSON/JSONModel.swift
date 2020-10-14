import Foundation

// MARK: - User
struct User: Codable {
    var photos: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    var id, sol: Int
    var camera: Camera
    var imgSrc: String
    var earthDate: String
    var rover: Rover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc
        case earthDate
        case rover
    }
}

// MARK: - Camera
struct Camera: Codable {
    var id: Int
    var name: String
    var roverID: Int
    var fullName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID
        case fullName
    }
}

// MARK: - Rover
struct Rover: Codable {
    var id: Int
    var name, landingDate, launchDate, status: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate
        case launchDate
        case status
    }
}
