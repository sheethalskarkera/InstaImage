//
//  ServiceRequestBuilder.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

final class ServiceRequestBuilder {
    
    internal static func urlRequest(for endpoint: CanineInformationEndpoint) -> URLRequest? {
        guard let url = URL(string: endpoint.path) else { return nil }
        
        var urlRequester = URLRequest(url: url)
        urlRequester.httpMethod = endpoint.method
        return urlRequester
    }
}
