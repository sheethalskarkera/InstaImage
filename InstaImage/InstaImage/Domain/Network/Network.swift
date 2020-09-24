//
//  Network.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

// MARK: - Types

/// Type for dictionary.
typealias JSON = [[String: Any]]

/// Service result.
typealias ServiceResult = Result<JSON>

/// Service callback.
typealias ServiceCallback = (ServiceResult) -> Void

/// Base service class
///
/// Implements common functionality for all service classess.
final class Network {
    static func submitRequest(with urlRequest: URLRequest, completion: @escaping ServiceCallback) {
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else {
                if let data = data {
                    do {
                        let stringValue =  #"\#(String(decoding: data, as: UTF8.self))"#
                        if let resultData = try JSONSerialization.jsonObject(with: Data(stringValue.utf8), options: []) as? JSON {
                            DispatchQueue.main.async {
                                completion(.success(resultData))
                            }
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                }
            }
        }.resume()
    }
}
