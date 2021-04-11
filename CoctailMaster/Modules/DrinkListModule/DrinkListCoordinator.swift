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
    var ingridient: Ingridient!

    init() {

    }

    deinit {
        print("DEINIT DrinkListCoordinator")
    }

    func start() {
        let viewController: DrinkListViewController = AppContainer.shared.resolve()
        viewController.viewModel.ingridient = ingridient
        navigationController.pushViewController(viewController, animated: true)
    }

    func finish() {
        parentCoordinator?.childDidFinish(self)
    }
}
