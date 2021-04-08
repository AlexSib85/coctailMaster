//
//  TabBarCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 12.01.2021.
//

import UIKit

class TabBarCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self

        let topRatedNavigationController = UINavigationController()
        topRatedNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let topRatedCoordinator = MainScreenCoordinator(navigationController: topRatedNavigationController)

        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search, tag: 1)
        let searchCoordinator = SearchScreenCoordinator(navigationController: searchNavigationController)

        let historyNavigationController = UINavigationController()
        historyNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .history, tag: 2)
        let historyCoordinator = InfoScreenCoordinator(navigationController: historyNavigationController)

        tabBarController.viewControllers = [topRatedNavigationController,
                                            searchNavigationController,
                                            historyNavigationController]

        childCoordinators.append(topRatedCoordinator)
        topRatedCoordinator.start()
        childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
        childCoordinators.append(historyCoordinator)
        historyCoordinator.start()

        let isNavigationStackEmpty = navigationController.viewControllers.isEmpty
        navigationController.pushViewController(tabBarController, animated: true)

        if !isNavigationStackEmpty {
            self.navigationController.viewControllers.remove(at: 0)
        }
    }
}
