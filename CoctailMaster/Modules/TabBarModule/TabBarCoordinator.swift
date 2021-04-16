//
//  TabBarCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 12.01.2021.
//

import UIKit

class TabBarCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self

        let mainScreenNavigationController = UINavigationController()
        mainScreenNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        AppContainer.shared.extensions(for: MainScreenCoordinator.self)?.setArgs(mainScreenNavigationController)
        let mainScreenCoordinator: MainScreenCoordinator = AppContainer.shared.resolve()

        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        AppContainer.shared.extensions(for: SearchScreenCoordinator.self)?.setArgs(searchNavigationController)
        let searchCoordinator: SearchScreenCoordinator = AppContainer.shared.resolve()

        let favoritsNavigationController = UINavigationController()
        favoritsNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        AppContainer.shared.extensions(for: FavoritsScreenCoordinator.self)?.setArgs(favoritsNavigationController)
        let favoritsCoordinator: FavoritsScreenCoordinator = AppContainer.shared.resolve()

        tabBarController.viewControllers = [mainScreenNavigationController,
                                            searchNavigationController,
                                            favoritsNavigationController]

        childCoordinators.append(mainScreenCoordinator)
        mainScreenCoordinator.start()
        childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
        childCoordinators.append(favoritsCoordinator)
        favoritsCoordinator.start()

        let isNavigationStackEmpty = navigationController.viewControllers.isEmpty
        navigationController.pushViewController(tabBarController, animated: true)

        if !isNavigationStackEmpty {
            self.navigationController.viewControllers.remove(at: 0)
        }
    }
}
