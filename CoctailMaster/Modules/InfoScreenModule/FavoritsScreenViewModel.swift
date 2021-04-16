//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

protocol FavoritsScreenViewModelOutput: AnyObject {
    func needUpdateTableView()
}

class FavoritsScreenViewModel {

    private var dataService: DataService
    weak var output: FavoritsScreenViewModelOutput?
    private(set) var favoriteDrinks: [DrinkModel] = []

    init(dataService: DataService) {
        self.dataService = dataService
    }

    func viewLoaded() {

    }

    func viewShown() {
        loadData()
    }

    private func loadData() {
        favoriteDrinks = dataService.favoriteDrinks()
        output?.needUpdateTableView()
    }
}
