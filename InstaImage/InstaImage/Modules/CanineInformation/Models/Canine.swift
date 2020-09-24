//
//  Canine.swift
//  InstaImage
//
//  Created by Sheethal on 22/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

typealias Details = [Canine]

struct Canine: Codable {
    let breeds: [Breeds]?
    let urlString: String
    let width: Double
    let height: Double
    
    private enum CodingKeys: String, CodingKey {
        case breeds
        case urlString = "url"
        case width
        case height
    }
}

struct Breeds: Codable {
    let name: String
    let lifeSpan: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case lifeSpan = "life_span"
    }
}
