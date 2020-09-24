//
//  CanineInformationServiceProvider.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

public protocol CanineInformationServiceProvider {
    func getDetails<T: Codable>(model: T.Type,
                                   completion: @escaping (Result<T>) -> Void)
}


