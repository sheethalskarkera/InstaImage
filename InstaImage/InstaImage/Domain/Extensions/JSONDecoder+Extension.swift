//
//  JSONDecoder+Extension.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T>(_ type: T.Type, jsonObject: JSON) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
        return try decode(type, from: data)
    }
}
