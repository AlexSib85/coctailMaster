//
//  ViewController.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class SearchScreenViewController: UIViewController {

    var viewModel: SearchScreenViewModel!

    @UsesAutoLayout private var tableView = UITableView()
    private let searchController: UISearchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewLoaded()
        viewModel.output = self
    }

    private func setupUI() {

        title = "Поиск коктейлей"
        view.backgroundColor = .white

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        view.addSubview(tableView)

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController

        makeConstraints()
    }

    private func makeConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension SearchScreenViewController: SearchScreenViewModelOutput {
    func needUpdateTableView() {
        tableView.reloadData()
    }
}

extension SearchScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.drinks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.drinks[safe: indexPath.row]?.strDrink
        return cell
    }
}

extension SearchScreenViewController: UITableViewDelegate {

}

extension SearchScreenViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

        let searchString = searchController.searchBar.text?.lowercased() ?? ""
        print("searchString \(searchString)")
        viewModel.searchDrinkBy(string: searchString)
    }
}
