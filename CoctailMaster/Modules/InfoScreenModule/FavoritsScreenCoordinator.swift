//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class FavoritsScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }

    func start() {
        AppContainer.shared.register { FavoritsScreenViewModel(dataService: $0) }
            .lifetime(.objectGraph)

        AppContainer.shared.register { FavoritsScreenViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        let viewController: FavoritsScreenViewController = AppContainer.shared.resolve()

        navigationController.pushViewController(viewController, animated: true)
    }
}
