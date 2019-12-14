//
//  AdviceAPIClient.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/13/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

struct AdviceAPIClient {
    
    static func getAdvice(completion: @escaping (Result<Slip, AppError>) -> ()) {
        
        let adviceEndpointURLString = "https://api.adviceslip.com/advice"
        
//        guard let url = URL(string: adviceEndpointURLString) else {
//            completion(.failure(.badURL(adviceEndpointURLString)))
//            return
//        }
//
//        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: adviceEndpointURLString) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                do {
                    let advice = try JSONDecoder().decode(Slip.self, from: data)
                    completion(.success(advice))
                } catch {
                    print(error)
                }
            }
        }
    }
}
