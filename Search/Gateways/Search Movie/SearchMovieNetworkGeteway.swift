//
//  SearchMovieNetworkGeteway.swift
//  Search
//
//  Created by Pavel on 10.07.22.
//

import Foundation
import Combine
import Shared_Models
import Extensions

// MARK: - Search Movie Network Geteway
struct SearchMovieNetworkGeteway: SearchMovieGeteway {
    func fetch(with parameters: SearchMovieGetewayParameters) -> AnyPublisher<MovieResultEntity, Error> {
        guard let url = URL(string: "\(Keys.baseAPIURL)search/movie\(Keys.key)&query=\(parameters.query)&page=\(parameters.page)") else {
            fatalError()
        }
        
        return URLRequest.load(resources: Resources<MovieResultEntity>(url: url))

    }
    
    
}
