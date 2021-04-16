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
    }

    private func setupUI() {

        title = "Поиск напитков"
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
        cell.textLabel?.text = viewModel.drinks[safe: indexPath.row]?.title
        cell.imageView?.image = viewModel.drinks[safe: indexPath.row]?.isFavorite ?? false ? R.image.favorite_active() : R.image.favorite_inactive()
        return cell
    }
}

extension SearchScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectedCell(at: indexPath.row)
        print("indexPath \(indexPath)")
    }
}

extension SearchScreenViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text?.lowercased() ?? ""
        viewModel.searchDrinkBy(string: searchString)
    }
}
