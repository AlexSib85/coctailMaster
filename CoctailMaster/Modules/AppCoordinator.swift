//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit
import SwiftyUserDefaults

class AppCoordinator: Coordinator {
    private let window: UIWindow
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!

    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        self.window.rootViewController = navigationController
    }

    func start() {
        if Defaults[\.needShowOnboarding] {
            showOnboarding()
        } else {
            showMainScreen()
        }
    }

    func showOnboarding() {
        let child = OnboardingCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }

    func showMainScreen() {
        let child = TabBarCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
        start()
    }
}
