//
//  EarthquakeCellViewModel.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import Foundation

final class EarthquakeCellViewModel {
    
    static let reuseIdentifier = "EarthquakeCell"
    
    private(set) var magnitude: String
    private(set) var depth: String
    private(set) var source: String
    private(set) var date: String
    private(set) var latitude: String
    private(set) var longitude: String
    
    private let earthquake: Earthquake
    
    init(earthquake: Earthquake) {
        self.earthquake = earthquake
        self.depth = String(earthquake.depth)
        self.source = String(earthquake.source)
        self.date = earthquake.date
        self.latitude = String(earthquake.latitude)
        self.longitude = String(earthquake.longitude)
        self.magnitude = String(earthquake.magnitude)
    }
    
     func isBigMagnitudeEarthquake() -> Bool {
        return self.earthquake.magnitude >= 8 ? true : false
    }
}
