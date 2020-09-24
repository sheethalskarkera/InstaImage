//
//  CanineInformationViewModel.swift
//  InstaImage
//
//  Created by Sheethal on 22/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

class CanineInformationViewModel {
    
    let service = CanineInformationService()
    
    func fetchDetails() {
        service.getDetails(model: Canine.self) { result in

            switch result {
            case let .success(info):
                
                break
            case .failure(_):
                break
            }
            
        }
    }
    
}

struct CanineInformationCellViewModel {
    let name: String?
    let lifeSpan: String?
    let imageString: String?
}
