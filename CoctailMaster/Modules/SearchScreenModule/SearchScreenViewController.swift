//
//  ViewController.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class SearchScreenViewController: UIViewController {

    var viewModel: SearchScreenViewModel!

    @UsesAutoLayout private var stackView = UIStackView()
    @UsesAutoLayout private var label: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewLoaded()
    }

    private func setupUI() {

        view.backgroundColor = .green

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        view.addSubview(stackView)

        label.text = "Search screen"
        label.textAlignment = .center
        stackView.addArrangedSubview(label)

        makeConstraints()
    }

    private func makeConstraints() {
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}