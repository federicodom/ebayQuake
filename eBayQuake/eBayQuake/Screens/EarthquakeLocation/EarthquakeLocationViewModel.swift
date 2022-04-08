//
//  EarthquakeLocationViewModel.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 07/04/2022.
//

import MapKit

final class EarthquakeLocationViewModel {
    
    private(set) var latitude: Double
    private(set) var longitude: Double
    
    private let earthquake: Earthquake
    
    init( earthquake: Earthquake) {
        self.earthquake = earthquake
        self.longitude = earthquake.longitude
        self.latitude = earthquake.latitude
    }
    
    func getEarthquakeCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: earthquake.latitude , longitude: earthquake.longitude)
    }
}
