//
//  AppError.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/13/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

enum AppError: Error {
    
    case badURL(String)
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError(Error)
    case badStatusCode(Int)
    case badMimeType(String)
    case missingValue
    
}
