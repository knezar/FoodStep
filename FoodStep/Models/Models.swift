//
//  Models.swift
//  FoodStep
//
//  Created by C4Q on 12/7/18.
//  Copyright © 2018 FoodStepProject. All rights reserved.
//

import Foundation

struct Location: Codable {
    var lat: Double
    var lng: Double
    var formattedAddress: [String]
    var distance: Int
}

struct Venue: Codable {
    var id: String
    var name: String
    var geoLocation: Location
    enum CodingKeys: String, CodingKey {
        case geoLocation = "location"
        case id
        case name
    }
}

//struct Items: Codable {
//    var venue: Venue
//}

//struct Group: Codable {
//    var items: [Item]
//}
struct Response: Codable {
    var venues: [Venue]
}

struct FSLocations: Codable {
    var response: Response
}

struct ImageString: Codable {
    var prefix: String
    var suffix: String
}

struct ImageItems: Codable {
    var items: [ImageString]
}

struct Photos: Codable {
    var photos: ImageItems
}
struct ImageIRes: Codable {
    var response: Photos
}



