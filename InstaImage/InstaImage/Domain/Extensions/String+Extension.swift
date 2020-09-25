//
//  String+Extension.swift
//  InstaImage
//
//  Created by Sheethal on 25/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

extension String {
    
    func extractYearsFromString() -> (Int, Int){
        let stringValue = self.replacingOccurrences(of: " ", with: "")
        let secondValue = stringValue.components(separatedBy: "-").last?.components(separatedBy: "years").first ?? "0"
        let firstValue = stringValue.contains("-")
            ? stringValue.components(separatedBy: "-").first ?? "0"
            : secondValue
        return (Int(firstValue) ?? 0, Int(secondValue ) ?? 0)
    }
}
