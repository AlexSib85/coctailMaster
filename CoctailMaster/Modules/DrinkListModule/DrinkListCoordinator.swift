//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit

class DrinkListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!
    weak var parentCoordinator: Coordinator?
    var ingridient: Ingridient

    init(navigationController: UINavigationController, ingridient: Ingridient) {
        self.navigationController = navigationController
        self.ingridient = ingridient
    }

    func start() {
        AppContainer.shared.extensions(for: DrinkListViewModel.self)?.setArgs(ingridient)
        let viewController: DrinkListViewController = AppContainer.shared.resolve()
        navigationController.pushViewController(viewController, animated: true)
    }

    func finish() {
        parentCoordinator?.childDidFinish(self)
    }
}
