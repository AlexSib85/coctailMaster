//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class SearchScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("DEINIT SearchScreenCoordinator")
    }

    func start() {
        let viewController: SearchScreenViewController = AppContainer.shared.resolve()
        navigationController.pushViewController(viewController, animated: true)
    }
}
