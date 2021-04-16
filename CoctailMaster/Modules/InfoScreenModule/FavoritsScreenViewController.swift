//
//  ViewController.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class FavoritsScreenViewController: UIViewController {

    var viewModel: FavoritsScreenViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewLoaded()
    }

    private func setupUI() {

        view.backgroundColor = .white

        makeConstraints()
    }

    private func makeConstraints() {

    }
}
