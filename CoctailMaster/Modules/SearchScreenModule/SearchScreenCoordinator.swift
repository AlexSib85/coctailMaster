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

    func start() {
        AppContainer.shared.register { SearchScreenViewModel(dataService: $0) }
            .lifetime(.objectGraph)

        AppContainer.shared.register { SearchScreenViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        let viewController: SearchScreenViewController = AppContainer.shared.resolve()

        navigationController.pushViewController(viewController, animated: true)
    }
}
