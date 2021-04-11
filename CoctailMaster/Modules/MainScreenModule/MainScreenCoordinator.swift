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

    init() {

    }

    deinit {
        print("DEINIT MainScreenCoordinator")
    }

    func start() {
        let viewController: MainScreenViewController = AppContainer.shared.resolve()
        navigationController.pushViewController(viewController, animated: false)
    }

    func showDrinksWith(ingridient: Ingridient) {
        let child: DrinkListCoordinator = AppContainer.shared.resolve()
        child.ingridient = ingridient
        child.navigationController = navigationController
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
