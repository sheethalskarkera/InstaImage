//
//  CanineInformationViewModelTests.swift
//  InstaImageTests
//
//  Created by Sheethal on 25/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import XCTest
@testable import InstaImage

class CanineInformationViewModelTests: XCTestCase {
    
    let viewModel = CanineInformationViewModel()
    
    override func setUp() {
        super.setUp()
        viewModel.canineInfo = [Canine(breeds: [Breeds(name: "Canine1", lifeSpan: "12 - 15 years")], urlString: "https://cdn2.thedogapi.com/images/BJT0Jx5Nm_1280.jpg", width: 125.8, height: 133.6),
                                Canine(breeds: [Breeds(name: "Canine2", lifeSpan: "12 - 16 years")], urlString: "https://cdn2.thedogapi.com/images/BJT0Jx5Nm_1280.jpg", width: 155.8, height: 1333.6),
            Canine(breeds: [Breeds(name: "Canine3", lifeSpan: "14 - 15 years")], urlString: "https://cdn2.thedogapi.com/images/BJT0Jx5Nm_1280.jpg", width: 1245.8, height: 1333.6),
            Canine(breeds: [Breeds(name: "Canine4", lifeSpan: "6 - 7 years")], urlString: "https://cdn2.thedogapi.com/images/BJT0Jx5Nm_1280.jpg", width: 1252.8, height: 1334.6)]
    }

    func testTitle() {
        XCTAssertEqual(viewModel.title, "Canine Information")
        XCTAssertEqual(viewModel.numberOfRows, 4)
    }
    
    func testCanineInformationCellViewModel() {
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 0).name!, "Canine1")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 0).lifeSpan!, "12 - 15 years")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 0).imageURL!, URL(string:  "https://cdn2.thedogapi.com/images/BJT0Jx5Nm_1280.jpg"))
    }
    
    func testSortCaninesAscending() {
        viewModel.sortCanines(.ascending)
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 0).name!, "Canine4")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 0).lifeSpan!, "6 - 7 years")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 1).name!, "Canine1")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 1).lifeSpan!, "12 - 15 years")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 2).name!, "Canine2")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 2).lifeSpan!, "12 - 16 years")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 3).name!, "Canine3")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 3).lifeSpan!, "14 - 15 years")
    }
    
    func testSortCaninesDescending() {
        viewModel.sortCanines(.descending)
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 0).name!, "Canine3")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 0).lifeSpan!, "14 - 15 years")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 1).name!, "Canine2")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 1).lifeSpan!, "12 - 16 years")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 2).name!, "Canine1")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 2).lifeSpan!, "12 - 15 years")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 3).name!, "Canine4")
        XCTAssertEqual(viewModel.fetchCanineInformationCellViewModel(for: 3).lifeSpan!, "6 - 7 years")
    }
}
