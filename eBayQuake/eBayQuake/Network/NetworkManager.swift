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
        let endpoint = EarthquakeApi.getEarthquakes
        request(endpoint: endpoint, completion: completion)
    }
    
}

private extension NetworkManager {
    func request<T:Codable>(endpoint: Endpoint, completion: @escaping (Result<T,EarthquakeApiError>) -> Void) {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
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
            } catch  {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
