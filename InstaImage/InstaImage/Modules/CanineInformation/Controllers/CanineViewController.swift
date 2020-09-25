//
//  CanineViewController.swift
//  InstaImage
//
//  Created by Sheethal on 21/9/20.
//  Copyright © 2020 Sheethal. All rights reserved.
//

import UIKit

class CanineViewController: UITableViewController {
    
    /// Propertires
    let viewModel = CanineInformationViewModel()

    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = viewModel.title
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchDetails()
    }
    
    // MARK:- UITableViewController
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CanineCell", for: indexPath) as? CanineDetailTableViewCell else { return UITableViewCell()}
        cell.bind(viewModel.fetchCanineInformationCellViewModel(for: indexPath.row))
        //cell.setNeedsLayout()
        return cell
    }
    
    @IBAction func tappedOnAscendingButton(_ sender: UIBarButtonItem) {
        viewModel.sortCanines(.ascending)
    }
    
    @IBAction func tappedOnDescendingButton(_ sender: UIBarButtonItem) {
        viewModel.sortCanines(.descending)
    }
    
    func presentAlertView(error: Error) {
        let alert = UIAlertController(
            title: error.localizedDescription,
            message: "",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: false, completion: nil)
    }
    
}

// MARK:- CanineInformationViewModelDelegate

extension CanineViewController: CanineInformationViewModelDelegate {
    func updateView() {
        tableView.reloadData()
    }
    
    func showErrorView(error: Error) {
        presentAlertView(error: error)
    }
}

