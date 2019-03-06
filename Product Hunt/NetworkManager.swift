//
//  NetworkManager.swift
//  Product Hunt
//
//  Created by Ricardo Rodriguez on 3/5/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import Foundation

class NetworkManager {
    let urlSession = URLSession.shared
    var baseURL = "https://api.producthunt.com/v1/"
    var token = "84d7389a37afcc6e43667ce464949e4f948ca6b7dcfb133ad39661c24d53b259"
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
        let fullURL = URL(string: baseURL + query)!
        var request = URLRequest(url: fullURL)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)",
            "Host": "api.producthunt.com"
        ]
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                return
            }
            
            guard let result = try? JSONDecoder().decode(PostList.self, from: data) else {
                return
            }
            
            let posts = result.posts
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        task.resume()
    }
    
}
