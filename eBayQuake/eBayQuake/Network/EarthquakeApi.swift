//
//  EarthquakeEndpoint.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import Foundation

enum EarthquakeApi: Endpoint {
    case getEarthquakes
    
    var scheme: String {
        switch self {
        default:
            return "http"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "api.geonames.org"
        }
    }
    
    var path: String {
        switch self {
        case .getEarthquakes:
            return "/earthquakesJSON"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getEarthquakes:
            return [URLQueryItem(name: "formatted", value: "true"),
                    URLQueryItem(name: "north", value: "44.1"),
                    URLQueryItem(name: "south", value: "-9.9"),
                    URLQueryItem(name: "east", value: "-22.4"),
                    URLQueryItem(name: "west", value: "55.2"),
                    URLQueryItem(name: "username", value: "mkoppelman")
            ]
        }
    }
    
    var method: String
    {
        switch self {
        default:
            return "GET"
        }
    }
}
