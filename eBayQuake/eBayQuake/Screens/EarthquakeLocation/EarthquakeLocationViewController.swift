//
//  LocationViewController.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 07/04/2022.
//

import UIKit
import MapKit

class EarthquakeLocationViewController: UIViewController {
    
    var mapView = MKMapView()
    private var earthquakeViewModel: EarthquakeLocationViewModel!

    init(earthquakeViewModel: EarthquakeLocationViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.earthquakeViewModel = earthquakeViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.mapView)
        configureMapView()
        render()
    }
    
    func render() {
        
        let coordinate = earthquakeViewModel.getEarthquakeCoordinate()
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion.init(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}

private extension EarthquakeLocationViewController {
    
    func configureMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor)
          
        ])
    }
}

