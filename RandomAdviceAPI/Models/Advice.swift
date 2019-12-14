//
//  Advice.swift
//  RandomAdviceAPI
//
//  Created by Kelby Mittan on 12/13/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation

struct Slip: Decodable {
    let slip: Advice
}

struct Advice: Decodable {
    let advice: String
}
