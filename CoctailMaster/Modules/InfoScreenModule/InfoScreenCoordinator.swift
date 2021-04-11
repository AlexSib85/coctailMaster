//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class InfoScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }

    func start() {
        AppContainer.shared.register { InfoScreenViewModel(dataService: $0) }
            .lifetime(.objectGraph)

        AppContainer.shared.register { InfoScreenViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        let viewController: InfoScreenViewController = AppContainer.shared.resolve()

        navigationController.pushViewController(viewController, animated: true)
    }
}
