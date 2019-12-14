//
//  RandomAdviceAPITests.swift
//  RandomAdviceAPITests
//
//  Created by Kelby Mittan on 12/13/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import XCTest
@testable import RandomAdviceAPI

class RandomAdviceAPITests: XCTestCase {

    func testAdvice() {
        
        let exp = XCTestExpectation(description: "searches found")
        let adviceEndpointURL = "https://api.adviceslip.com/advice"
        
//        let request = URLRequest(url: URL(string: adviceEndpointURL)!)
        
        NetworkHelper.shared.performDataTask(with: adviceEndpointURL) { (result) in
            switch result {
            case .failure(let appError):
                XCTFail("\(appError)")
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 1000, "should be \(data.count)")
            }
        }
        wait(for: [exp], timeout: 5.0)
    }

}
