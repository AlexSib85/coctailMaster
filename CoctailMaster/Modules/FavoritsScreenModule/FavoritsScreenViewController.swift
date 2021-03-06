//
//  ViewController.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class FavoritsScreenViewController: UIViewController {

    var viewModel: FavoritsScreenViewModel!

    @UsesAutoLayout private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewShown()
    }

    private func setupUI() {
        title = "Любимые напитки"
        view.backgroundColor = .lightMint

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.defaultCellIdentifier)
        view.addSubview(tableView)

        makeConstraints()
    }

    private func makeConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension FavoritsScreenViewController: FavoritsScreenViewModelOutput {
    func needUpdateTableView() {
        tableView.reloadData()
    }
}

extension FavoritsScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteDrinks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.defaultCellIdentifier) {
            cell.textLabel?.text = viewModel.favoriteDrinks[safe: indexPath.row]?.title
            cell.imageView?.image = viewModel.favoriteDrinks[safe: indexPath.row]?.isFavorite ?? false ? R.image.favorite_active() : R.image.favorite_inactive()
            return cell
        }
        return UITableViewCell()
    }
}

extension FavoritsScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectedCell(at: indexPath.row)
    }
}
