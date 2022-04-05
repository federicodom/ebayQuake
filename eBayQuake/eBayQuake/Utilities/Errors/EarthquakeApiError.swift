//
//  EarthquakeApiError.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import Foundation


enum EarthquakeApiError: String, Error {
    case unableToComplete = "Unable complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
