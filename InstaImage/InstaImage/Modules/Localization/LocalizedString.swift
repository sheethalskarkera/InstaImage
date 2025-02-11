//
//  LocalizedString.swift
//  InstaImage
//
//  Created by Sheethal on 22/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import UIKit

enum LocalizedString: CustomStringConvertible {
    /// Network Service errors
    case genericError
    case incorrectRequest
    case jsonNotFound
    
    var description: String {
        switch self {
        /// Network Service errors
        case .genericError:
            return localizeString("genericErrorMessage", comment: "Network service default error message")
        case .incorrectRequest:
            return localizeString("incorrectRequestErrorMessage", comment: "Error message for incorrect network service request")
        /// Mock testing  errors
        case .jsonNotFound:
            return localizeString("jsonNotFoundMessage", comment: "Unable to find mock testing json")
        }
    }
}

extension LocalizedString {
    private func localizeString(_ key: String, comment: String, _ arguments: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: nil, bundle: Bundle(for: BundleIdentifierClass.self), comment: comment)
        return String(format: format, locale: Locale.current, arguments: arguments)
    }
}

private final class BundleIdentifierClass {}
