//
//  UIFramework.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 11.04.2021.
//

import DITranquillity

public class UIFramework: DIFramework {
    public static func load(container: DIContainer) {

        container.register { MainScreenCoordinator(navigationController: arg($0)) }
            .lifetime(.perRun(.strong))

        container.register { MainScreenViewModel(dataService: $0, coordinator: $1) }
            .lifetime(.objectGraph)

        container.register { MainScreenViewController(nibName: nil, bundle: nil) }
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        container.register { DrinkListCoordinator(navigationController: arg($0), ingridient: arg($1) ) }
            .lifetime(.perRun(.weak))

        container.register { DrinkListViewModel(dataService: $0, coordinator: $1, ingridient: arg($2)) }
            .injection(cycle: true) { $0.output = $1 }
            .lifetime(.objectGraph)

        container.register { DrinkListViewController(nibName: nil, bundle: nil) }
            .as(DrinkListViewController.self)
            .as(DrinkListViewModelOutput.self)
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        container.register { SearchScreenCoordinator(navigationController: arg($0)) }
            .lifetime(.perRun(.strong))

        container.register { SearchScreenViewModel(dataService: $0) }
            .injection(cycle: true) { $0.output = $1 }
            .lifetime(.objectGraph)

        container.register { SearchScreenViewController(nibName: nil, bundle: nil) }
            .as(SearchScreenViewController.self)
            .as(SearchScreenViewModelOutput.self)
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)

        container.register { FavoritsScreenCoordinator(navigationController: arg($0)) }
            .lifetime(.perRun(.strong))

        container.register { FavoritsScreenViewModel(dataService: $0) }
            .injection(cycle: true) { $0.output = $1 }
            .lifetime(.objectGraph)

        container.register { FavoritsScreenViewController(nibName: nil, bundle: nil) }
            .as(FavoritsScreenViewController.self)
            .as(FavoritsScreenViewModelOutput.self)
            .injection { $0.viewModel = $1 }
            .lifetime(.objectGraph)
    }
}
