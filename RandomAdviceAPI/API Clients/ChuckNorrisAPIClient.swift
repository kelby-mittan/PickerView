//
//  ChuckNorrisAPIClient.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/14/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

struct ChuckNorrisAPIClient {
    
    static func getNorrisFacts(completion: @escaping (Result<ChuckNorris, AppError>) -> ()) {
        
        let norrisEndpointURLString = "https://api.chucknorris.io/jokes/random"
        
        NetworkHelper.shared.performDataTask(with: norrisEndpointURLString) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do {
                    let advice = try JSONDecoder().decode(ChuckNorris.self, from: data)
                    completion(.success(advice))
                } catch {
                    print(error)
                }
            }
        }
        
    }
}
