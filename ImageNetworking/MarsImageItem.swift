//
//  MarsImageItem.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 07/12/2020.
//

import Foundation

class Welcome: Identifiable, Codable {
    var photos: [Photo]?

    init(photos: [Photo]?) {
        self.photos = photos
    }
}

// MARK: - Photo
class Photo: Identifiable, Codable {
    var id, sol: Int?
    var camera: Camera?
    var imgSrc: String?
    var earthDate: String?
    var rover: Rover?

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
    
    init(id: Int?, sol: Int?, camera: Camera?, imgSrc: String?, earthDate: String?, rover: Rover?) {
        self.id = id
        self.sol = sol
        self.camera = camera
        self.imgSrc = imgSrc
        self.earthDate = earthDate
        self.rover = rover
    }
}

// MARK: - Camera
class Camera: Codable {
    var id: Int?
    var name: CameraName?
    var roverID: Int?
    var fullName: FullName?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }

    init(id: Int?, name: CameraName?, roverID: Int?, fullName: FullName?) {
        self.id = id
        self.name = name
        self.roverID = roverID
        self.fullName = fullName
    }
}

enum FullName: String, Codable {
    case mastCamera = "Mast Camera"
}

enum CameraName: String, Codable {
    case mast = "MAST"
}

// MARK: - Rover
class Rover: Codable {
    var id: Int?
    var name: RoverName?
    var landingDate, launchDate: String?
    var status: Status?

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }

    init(id: Int?, name: RoverName?, landingDate: String?, launchDate: String?, status: Status?) {
        self.id = id
        self.name = name
        self.landingDate = landingDate
        self.launchDate = launchDate
        self.status = status
    }
}

enum RoverName: String, Codable {
    case curiosity = "Curiosity"
}

enum Status: String, Codable {
    case active = "active"
}
