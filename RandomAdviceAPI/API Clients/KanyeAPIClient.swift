//
//  KanyeAPIClient.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/14/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

struct KanyeAPIClient {
    
    static func getKanyeQuotes(completion: @escaping (Result<Kanye, AppError>) -> ()) {
        
        let norrisEndpointURLString = "https://api.kanye.rest/"
        
        NetworkHelper.shared.performDataTask(with: norrisEndpointURLString) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do {
                    let advice = try JSONDecoder().decode(Kanye.self, from: data)
                    completion(.success(advice))
                } catch {
                    print(error)
                }
            }
        }
        
    }

}
