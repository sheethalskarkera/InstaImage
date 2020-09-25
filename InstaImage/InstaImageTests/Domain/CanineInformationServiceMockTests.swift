//
//  CanineInformationServiceMockTests.swift
//  InstaImageTests
//
//  Created by Sheethal on 25/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import XCTest
@testable import InstaImage

class CanineInformationServiceMockTests: XCTestCase {

    /// Properties
    var mockInformationService: MockInformationService?
    
    override func setUp() {
        mockInformationService = MockInformationService()
    }
    
    override func tearDown() {
        mockInformationService = nil
    }
    
    /// Test 'getDetails' service using mock response
    func testInformationServiceMock_success() {
        let expectation = self.expectation(description: "Get canine info successfully")
        
        /// Set stubs variable to 'fetchSuccess'
        mockInformationService?.stubs = .fetchSuccess
        
        mockInformationService?.getDetails(model: Details.self, completion: { result in
            
            /// Validate result object
            switch result {
                
            case let .success(info):
                XCTAssertNotNil(info)
                XCTAssertEqual(info[0].urlString,"https://cdn2.thedogapi.com/images/BJT0Jx5Nm_1280.jpg")
                XCTAssertEqual(info[0].width,1216.0)
                XCTAssertEqual(info[0].height,1131.0)
                XCTAssertEqual(info[0].breeds?.first?.lifeSpan,"11 - 13 years")
                XCTAssertEqual(info[0].breeds?.first?.name,"Anatolian Shepherd Dog")
                expectation.fulfill()
                
            case .failure(_):
                break
            }
        })
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    /// Test 'getDetails' service using mock response for 'Malformed json' error scenario
    func testInformationServiceMock_error() {
        let mocService = MockInformationService()
        let expectation = self.expectation(description: "Get malformed JSON error")
        mockInformationService = nil
        /// Set stubs variable to 'jsonMalformed'
        mocService.stubs = .jsonMalformed
        
        /// Validate result object
        mocService.getDetails(model: Details.self, completion: { result in
            
            switch result {
                
            case .success(_):
                break
                
            case let .failure(error):
                /// Validate error returned from service
                XCTAssertNotNil(error)
                if let serviceError = error as? ServiceError {
                    switch serviceError {
                    case .general(let messsage):
                        XCTAssertEqual(messsage, "Unable to find mock json.")
                    }
                }
                expectation.fulfill()
            }
        })
        
        waitForExpectations(timeout: 1, handler: nil)
    }

}
