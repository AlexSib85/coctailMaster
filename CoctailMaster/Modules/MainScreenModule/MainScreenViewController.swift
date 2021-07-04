//
//  ViewController.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class MainScreenViewController: UIViewController {

    var viewModel: MainScreenViewModel!

    @UsesAutoLayout private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.output = self
        viewModel.viewLoaded()
    }

    private func setupUI() {

        title = "Список ингридиентов"
        view.backgroundColor = .lightBlue

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

extension MainScreenViewController: MainScreenViewModelOutput {
    func needUpdateView() {
        tableView.reloadData()
    }
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.ingridients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.defaultCellIdentifier) {
            cell.textLabel?.text = viewModel.ingridients[safe: indexPath.row]?.strIngredient1
            return cell
        }
        return UITableViewCell()
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let ingridient = viewModel.ingridients[safe: indexPath.row] {
            viewModel.selected(ingridient: ingridient)
        }
    }
}
