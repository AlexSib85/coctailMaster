//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class MainScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        AppContainer.shared.register { MainScreenViewModel(dataService: $0) }
            .lifetime(.objectGraph)

        AppContainer.shared.register { MainScreenViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        let viewController: MainScreenViewController = AppContainer.shared.resolve()

        viewController.navigationItem.hidesBackButton = true
        navigationController.pushViewController(viewController, animated: false)
    }
}
