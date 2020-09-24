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
        viewModel.fetchDetails()
        title = viewModel.title
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.canineInfo?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CanineDetailTableViewCell else { return UITableViewCell()}
        cell.bind(viewModel.fetchCanineInformationCellViewModel(for: indexPath.row))
        return cell
    }
    
    @IBAction func tappedOnAscendingButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tappedOnDescendingButton(_ sender: UIBarButtonItem) {
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

