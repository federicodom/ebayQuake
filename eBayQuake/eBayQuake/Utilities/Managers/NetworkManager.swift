//
//  NetworkManager.swift
//  eBayQuake
//
//  Created by Federico Dominguez on 05/04/2022.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
        
    private init() {}
    
    func getEarthquake(completion: @escaping (Result<EarthquakeResponse, EarthquakeApiError>) -> Void) {
        let endpoint = "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman"
        taskForGetRequest(endpoint: endpoint, completion: completion)
    }
    
}

private extension NetworkManager {
    func taskForGetRequest<T:Decodable>(endpoint: String, completion: @escaping (Result<T,EarthquakeApiError>) -> Void) {
        var request = URLRequest(url: URL(string: endpoint)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(T.self, from: data)
                completion(.success(responseObject))
            } catch let decodingError {
                print(decodingError)
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
