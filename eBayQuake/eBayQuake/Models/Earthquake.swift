//
//  Earthquake.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import Foundation



struct EarthquakeResponse: Codable {
    let data: [Earthquake]
}

struct Earthquake: Codable {
    let id: String
    let magnitude: Double
    let date: String
    let depth: Double
    let source: String
    let longitude: Double
    let latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case depth, magnitude
        case id = "eqid"
        case date = "datetime"
        case longitude = "lng"
        case latitude = "lat"
        case source = "src"
        
    }
}


