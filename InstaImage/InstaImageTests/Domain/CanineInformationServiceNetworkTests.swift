//
//  CanineInformationServiceNetworkTests.swift
//  InstaImageTests
//
//  Created by Sheethal on 25/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import XCTest
@testable import InstaImage

class CanineInformationServiceNetworkTests: XCTestCase {
    
    /// Properties
    var infoService: CanineInformationService?
    
    override func setUp() {
        infoService = CanineInformationService()
    }
    
    override func tearDown() {
        infoService = nil
    }
    
    /// Test 'getDetails' service for network request and successfull JSON parsing
    func testInformationService_success() {
        let expectation = self.expectation(description: "Get canine info successfully")
        
        infoService?.getDetails(model: Details.self) { result in
            /// Validate result object
            switch result {
                
            case let .success(info):
                XCTAssertNotNil(info)
                expectation.fulfill()
            case .failure(_):
                break
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
}
