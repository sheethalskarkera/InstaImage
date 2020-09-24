//
//  ViewController.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let viewModel = CanineInformationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchDetails()
    }


}

