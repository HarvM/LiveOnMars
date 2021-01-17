//
//  Welcome.swift
//  LiveOnMars
//
//  Created by Marc Harvey on 17/01/2021.
//

import Foundation

//Generated using Paste JSON as Code

// MARK: - Welcome
struct Welcome: Codable {
    var photos: [Photo]?
}

// MARK: - Photo
struct Photo: Codable, Identifiable {
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
}

// MARK: - Camera
struct Camera: Codable {
    var id: Int?
    var name: CameraName?
    var roverID: Int?
    var fullName: FullName?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

enum FullName: String, Codable {
    case mastCamera = "Mast Camera"
}

enum CameraName: String, Codable {
    case mast = "MAST"
}

// MARK: - Rover
struct Rover: Codable {
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
}

enum RoverName: String, Codable {
    case curiosity = "Curiosity"
}

enum Status: String, Codable {
    case active = "active"
}
