//
//  InformationServiceStubs.swift
//  InstaImageTests
//
//  Created by Sheethal on 25/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

/// Enums depicting JSON stub file names used for mock testing
enum InformationServiceStubs: String {
    case none
    case fetchSuccess = "response_success"
    case jsonMalformed = "response_error"

    /// Return path of JSON files used for mock testing
    var path: String? {
        return Bundle(for: MockInformationService.self).path(forResource: rawValue, ofType: "json")
    }
}
