//
//  PokemonViewController.swift
//  PokemonProject
//
//  Created by Tag Livros on 08/01/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit
import SVProgressHUD

class PokemonViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private let networking = PokemonNetworking()
    private let pokemonCellIdentifier = "pokemonCell"
    private let cellHeight: CGFloat = 160
    private var viewModel: PokemonViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        setupTableView()
        setupFetch()
    }
    
    // MARK: - Functions
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupBind() {
        viewModel = PokemonViewModel(networking: networking)
        
        viewModel.dataProvider.bind { [weak self] dataProvider in
            guard let strongSelf = self else { return }
            switch dataProvider.editingStyle {
            case .reloadAll:
                strongSelf.tableView.reloadData()
            case .reload(_, let indexPath):
                strongSelf.tableView.reloadRows(at: [indexPath], with: .automatic)
            default:
                break
            }
        }
        
        viewModel.loader.bind { loader in
            loader ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        }
        
        viewModel.error.bind { [weak self] error in
            guard let strongSelf = self, error != nil else { return }
            strongSelf.showAlert(message: "Ocorreu um erro inesperado")
        }
        
    }
    
    private func setupFetch() {
        viewModel.getPokemons(offset: 0, limit: 20)
    }
    
    func showAlert(title: String = "Ops!", message: String, confirmAction: UIAlertAction? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
        if let unConfirmAction = confirmAction {
            alertController.addAction(unConfirmAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
        } else {
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        }
    
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension PokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataProvider.value.elements[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataProvider.value.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel[indexPath.section][indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: pokemonCellIdentifier, for: indexPath) as? PokemonTableViewCell {
            cell.viewModel = cellViewModel
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension PokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
