//
//  NetworkManager.swift
//  movie-app-test
//
//  Created by Tsenguun on 1/3/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
//    let cache = NSCache<NSString, UIImage>() // cache

    private init() {}
    
    
    func singleMovieDetail(completed: @escaping(Result<[MovieeDetailsModel], MovieError>) -> Void) {
        
        let endPoint = "https://api.tvmaze.com/shows"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUrlLink))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieDetails = try decoder.decode([MovieeDetailsModel].self, from: data)
                completed(.success(movieDetails))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }

}
