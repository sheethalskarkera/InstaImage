//
//  CanineInformationService.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

class CanineInformationService {
    
    /**
     Makes Network request and decodes returned JSON data into models.
     
     - Parameters:
     - endpoint: The network endpoint for the request
     - result: The response model for given request  endpoint
     - completion: Completion block with Result type (success or failure)
     
     */
    func request<T>(for endpoint: CanineInformationEndpoint,
                    model: T.Type,
                    completion: @escaping (Result<T>) -> Void) where T: Codable {
        
        /// Get urlRequest object for given endpoint
        guard let urlRequest = ServiceRequestBuilder.urlRequest(for: endpoint) else {
            let serviceError = ServiceError.general(messsage: LocalizedString.incorrectRequest.description)
            return completion(.failure(serviceError))
        }
        
        /// Make network call
        Network.submitRequest(with: urlRequest) { result in
            switch result {
            case let .success(jsonData):
                do {
                    /// Decode JSON object into models
                    let responseModel = try JSONDecoder().decode(T.self, jsonObject: jsonData)
                    print(responseModel)
                    completion(.success(responseModel))
                } catch  {
                    /// Decoding failed,  return error
                    let genericError = ServiceError.general(messsage: LocalizedString.genericError.description)
                    completion(.failure(genericError))
                }
                
            case let .failure(error):
                /// Network request failure encountered, return error
                completion(.failure(error))
            }
        }
        
    }
}

extension CanineInformationService: CanineInformationServiceProvider {
    func getDetails<T>(model: T.Type, completion: @escaping (Result<T>) -> Void) where T: Codable {
        request(for: .info, model: model, completion: completion)
    }
}
