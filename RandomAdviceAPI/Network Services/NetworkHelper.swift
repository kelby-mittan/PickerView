//
//  NetworkHelper.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/13/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private var session: URLSession
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func performDataTask(with urlString: String,
                         completion: @escaping (Result<Data, AppError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299:
                break
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
                return
            }
            
            completion(.success(data))
            
        }
        
        dataTask.resume()
    }
    
//    func performDataTask(with request: URLRequest,
//                         completion: @escaping (Result<Data, AppError>) -> ()) {
//        // two states on dataTask, resume() and suspended by default
//        // suspended simply won't perform network request
//        // this ultimately leads to debugging errors and time lost if
//        // you don't explicitly resume() request
//
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//
//            // 1. deal with error if any
//            // check for client network errors
//            if let error = error {
//                completion(.failure(.networkClientError(error)))
//            }
//
//            // 2. downcast URLResponse (response) to HTTPURLResponse to
//            //    get access to the statusCode property on HTTPURLResponse
//            guard let urlResponse = response as? HTTPURLResponse else {
//                completion(.failure(.noResponse))
//                return
//            }
//
//            // 3. unwrap the data object
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//
//            // 4. validate that the status code is in the 200 range otherwise it's a
//            //    bad status code
//            switch urlResponse.statusCode {
//            case 200...299: break // everything went well here
//            default:
//                completion(.failure(.badStatusCode(urlResponse.statusCode)))
//                return
//            }
//
//            // 5. capture data as success case
//            completion(.success(data))
//        }
//        dataTask.resume()
//    }
    

}
