//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class MainScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!
    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController: MainScreenViewController = AppContainer.shared.resolve()
        navigationController.pushViewController(viewController, animated: false)
    }

    func showDrinksWith(ingridient: Ingridient) {
        AppContainer.shared.extensions(for: DrinkListCoordinator.self)?.setArgs(navigationController, ingridient)
        let child: DrinkListCoordinator = AppContainer.shared.resolve()
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
