//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class RootCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        AppContainer.shared.register { RootViewModel(networkService: $0) }

        AppContainer.shared.register(RootViewController.init)
            .injection { $0.viewModel = $1 }

        let viewController: RootViewController = AppContainer.shared.resolve()
        navigationController.pushViewController(viewController, animated: false)
    }
}
