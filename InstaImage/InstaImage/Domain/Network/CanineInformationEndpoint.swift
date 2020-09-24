//
//  CanineInformationEndpoint.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

public enum CanineInformationEndpoint {
    
    case info
    
    var path: String {
        switch self {
        case .info:
            return "https://api.thedogapi.com/v1/images/search?limit=50"
        }
    }
    
    var scheme: String {
        switch self {
        case .info:
            return "https"
        }
    }
    
    var method: String {
        switch self {
        case .info:
            return "GET"
        }
    }
}
