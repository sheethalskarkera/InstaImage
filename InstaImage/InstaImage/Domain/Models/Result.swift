//
//  Result.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

/// Result type.
public enum Result<T> {
    /// Success.
    case success(T)

    /// Failure.
    case failure(Error)
}
