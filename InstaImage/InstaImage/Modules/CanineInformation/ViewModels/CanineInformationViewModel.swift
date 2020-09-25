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
    
    enum SortOrder {
        case ascending
        case descending
    }
    
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
                self.canineInfo = info.filter { !($0.breeds?.isEmpty ?? true)}
                self.sortCanines(.ascending)
            case .failure(let error):
                self.delegate?.showErrorView(error: error)
            }
        }
    }
    
    func sortCanines(_ order : SortOrder) {
        if case .ascending = order {
            self.canineInfo?.sort(by: { (x, y) -> Bool in
                guard let firstTuple = x.breeds?.first?.lifeSpan.extractYearsFromString(),
                    let secondTuple = y.breeds?.first?.lifeSpan.extractYearsFromString() else { return false }
                return firstTuple.0 < secondTuple.0 || (firstTuple.0 == secondTuple.0 && firstTuple.1 < secondTuple.1)
            })
        } else {
            self.canineInfo?.sort(by: { (x, y) -> Bool in
                guard let firstTuple = x.breeds?.first?.lifeSpan.extractYearsFromString(),
                    let secondTuple = y.breeds?.first?.lifeSpan.extractYearsFromString() else { return false }
                return firstTuple.0 > secondTuple.0 || (firstTuple.0 == secondTuple.0 && firstTuple.1 > secondTuple.1)
            })
        }
        delegate?.updateView()
    }
    
    func fetchCanineInformationCellViewModel(for index: Int) -> CanineInformationCellViewModel {
        CanineInformationCellViewModel(name: canineInfo?[index].breeds?.first?.name,
                                       lifeSpan: canineInfo?[index].breeds?.first?.lifeSpan,
                                       imageURL: URL(string: canineInfo?[index].urlString ?? ""))
    }
    
    var numberOfRows: Int {
        canineInfo?.count ?? 0
    }
    
}
