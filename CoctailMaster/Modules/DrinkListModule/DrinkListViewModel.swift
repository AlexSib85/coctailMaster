//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

protocol DrinkListViewModelOutput: AnyObject {
    func needUpdateView()
}

class DrinkListViewModel {

    private var dataService: DataService
    weak var output: DrinkListViewModelOutput?
    weak var coordinator: DrinkListCoordinator?
    var ingridient: Ingridient?
    private(set) var drinks: [Drink] = []

    init(dataService: DataService, coordinator: DrinkListCoordinator?) {
        self.dataService = dataService
        self.coordinator = coordinator
    }

    deinit {
        print("DEINIT DrinkListViewModel")
    }

    func viewLoaded() {
        loadData()
    }

    func finish() {
        coordinator?.finish()
    }

    private func loadData() {
        dataService.getIngridientList { ingridients, error in
            if let error = error {
                print("Error!!!!!!!!!!!!!!!!! \(error)")
                return
            }

            self.output?.needUpdateView()
        }
    }
}
