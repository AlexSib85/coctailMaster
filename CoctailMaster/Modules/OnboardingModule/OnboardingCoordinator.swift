//
//  MainCoordinator.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import UIKit
import SwiftyUserDefaults

class OnboardingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController!
    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        AppContainer.shared.register { [weak self] in return OnboardingViewModel(dataService: $0, coordinator: self) }
            .injection(cycle: true, \.output)
            .lifetime(.objectGraph)

        AppContainer.shared.register { OnboardingViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .as(OnboardingViewController.self)
            .as(OnboardingViewModelOutput.self)
            .lifetime(.objectGraph)

        let viewController: OnboardingViewController = AppContainer.shared.resolve()

        viewController.navigationItem.hidesBackButton = true
        navigationController.pushViewController(viewController, animated: true)
    }

    func didFinishOnboarding() {
        Defaults[\.needShowOnboarding] = false
        parentCoordinator?.childDidFinish(self)
    }
}
