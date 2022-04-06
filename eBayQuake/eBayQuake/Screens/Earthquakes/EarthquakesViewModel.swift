//
//  EarthquakesViewModel.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import Foundation

protocol EarthquakesViewModelDelegate: AnyObject {
    func didFinishLoading()
    func didFinishFetching()
    func didFinishWithError()
}

final class EarthquakesViewModel {
    
    private(set) var earthquakes: [Earthquake] = []
    private(set) var errorMessage: String = ""
    
    weak var delegate: EarthquakesViewModelDelegate?
    
    var numberOfRowsInSection: Int {
        return earthquakes.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Earthquake {
        return earthquakes[indexPath.row]
    }
    
    func fetchEarthquakes() {
        NetworkManager.shared.getEarthquakes { [weak self] result in
            switch result {
            case .success(let response):
                self?.earthquakes = response.earthquakes 
                self?.delegate?.didFinishLoading()
                self?.delegate?.didFinishFetching()
            case .failure(let error):
                self?.errorMessage = error.rawValue
                self?.delegate?.didFinishLoading()
                self?.delegate?.didFinishWithError()
            }
        }
    }
}
