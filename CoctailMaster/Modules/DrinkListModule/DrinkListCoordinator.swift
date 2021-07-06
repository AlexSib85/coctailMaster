//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit
import DITranquillity

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
        var arguments = AnyArguments()
        arguments.addArgs(for: DrinkListViewModel.self, args: ingridient)
        let viewController: DrinkListViewController = AppContainer.shared.resolve(arguments: arguments)
        navigationController.pushViewController(viewController, animated: true)
    }

    func finish() {
        parentCoordinator?.childDidFinish(self)
    }
}
