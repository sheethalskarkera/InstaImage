//
//  CanineInformationViewModel.swift
//  InstaImage
//
//  Created by Sheethal on 22/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import Foundation

protocol CanineInformationViewModelDelegate: AnyObject {
    func updateView()
    func showErrorView(error: Error)
}

class CanineInformationViewModel {
    
    let service = CanineInformationService()
    weak var delegate: CanineInformationViewModelDelegate?
    
    var title: String {
        "Canine Information"
    }
    
    var canineInfo: [Canine]?
    
    func fetchDetails() {
        service.getDetails(model: Details.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(info):
                self.canineInfo = info.filter {
                    !($0.breeds?.isEmpty ?? true)
                }
                self.delegate?.updateView()
            case .failure(let error):
                self.delegate?.showErrorView(error: error)
            }
        }
    }
    
    func fetchCanineInformationCellViewModel(for index: Int) -> CanineInformationCellViewModel {
        CanineInformationCellViewModel(name: canineInfo?[index].breeds?.first?.name,
                                       lifeSpan: canineInfo?[index].breeds?.first?.lifeSpan,
                                       imageString: URL(string: canineInfo?[index].urlString ?? ""))
    }
    
}
