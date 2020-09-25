//
//  MockInformationService.swift
//  InstaImageTests
//
//  Created by Sheethal on 25/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import XCTest
@testable import InstaImage

class MockInformationService: CanineInformationService {
    
    /// OrderServiceStubs
    var stubs: InformationServiceStubs = .none
    
    // MARK: - Internal routines
    
    /**
     Deserializes JSON stub files and decodes JSON data into models.
     
     - Parameters:
     - endpoint: The network endpoint for the request
     - result: The response model for given request  endpoint
     - completion: Completion block with Result type (success or failure)
     
     */
    override func request<T>(for endpoint: CanineInformationEndpoint,
                             model: T.Type,
                             completion: @escaping (Result<T>) -> Void) where T : Codable {
        guard let path = stubs.path else {
            /// Error encountered in determining path for JSON file, return error
            return completion(.failure(ServiceError.general(messsage: LocalizedString.jsonNotFound.description)))
        }
        
        do {
            /// Try serializing JSON
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            if let jsonData = try JSONSerialization.jsonObject(with: data,
                                                               options: JSONSerialization.ReadingOptions()) as? JSON {
                
                do {
                    /// JSON decoded successfully, returns  model in response
                    let decodedResponseModel = try JSONDecoder().decode(T.self, jsonObject: jsonData)
                    completion(.success(decodedResponseModel))
                } catch  {
                    /// JSON decoding failed, return error
                    let genericError = ServiceError.general(messsage: LocalizedString.genericError.description)
                    completion(.failure(genericError))
                }
            }
        } catch {
            /// JSON serialization failed, return error
            completion(.failure(error))
        }
    }
    
}
