//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

protocol MainScreenViewModelOutput: AnyObject {
    func needUpdateView()
}

class MainScreenViewModel {

    private var dataService: DataService
    weak var output: MainScreenViewModelOutput?
    weak var coordinator: MainScreenCoordinator?
    private(set) var ingridients: [Ingridient] = []

    init(dataService: DataService, coordinator: MainScreenCoordinator?) {
        self.dataService = dataService
        self.coordinator = coordinator
    }

    func viewLoaded() {
        loadData()
    }

    func selected(ingridient: Ingridient) {
        self.coordinator?.showDrinksWith(ingridient: ingridient)
    }

    private func loadData() {
        dataService.getIngridientList { ingridients, error in
            if let error = error {
                print("Error! \(#file) \(#function) \(error)")
                return
            }
            self.ingridients = ingridients ?? []
            self.output?.needUpdateView()
        }
    }
}
