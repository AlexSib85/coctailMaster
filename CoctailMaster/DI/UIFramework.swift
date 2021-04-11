//
//  UIFramework.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 11.04.2021.
//

import DITranquillity

public class UIFramework: DIFramework {
    public static func load(container: DIContainer) {

        container.register(MainScreenCoordinator.init)
            .lifetime(.perRun(.strong))

        container.register { MainScreenViewModel(dataService: $0, coordinator: $1) }
            .lifetime(.objectGraph)

        container.register { MainScreenViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        container.register(DrinkListCoordinator.init)
            .lifetime(.perRun(.weak))

        container.register { DrinkListViewModel(dataService: $0, coordinator: $1) }
            .lifetime(.objectGraph)

        container.register { DrinkListViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)
    }
}
