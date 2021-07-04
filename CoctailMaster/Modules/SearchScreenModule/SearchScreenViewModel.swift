//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

protocol SearchScreenViewModelOutput: AnyObject {
    func needUpdateTableView()
}

class SearchScreenViewModel {

    private var dataService: DataService
    weak var output: SearchScreenViewModelOutput?
    private var searchTimer: Timer?
    private var searchString: String = ""
    private(set) var drinks: [DrinkModel] = []

    init(dataService: DataService) {
        self.dataService = dataService
    }

    func viewLoaded() {

    }

    func searchDrinkBy(string: String) {
        if let searchTimer = searchTimer {
            searchTimer.invalidate()
        }
        searchString = string
        searchTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(startSearchDrink), userInfo: nil, repeats: false)

    }

    func selectedCell(at index: Int) {
        if drinks.indices.contains(index) {
            drinks[index].toggleFavorite()
            dataService.saveFavorite(drinks: drinks.filter { $0.isFavorite })
            output?.needUpdateTableView()
        }
    }

    @objc
    private func startSearchDrink() {
        dataService.searchDrinksBy(string: searchString) { drinks, error in
            if let error = error {
                print("Error! \(#file) \(#function) \(error)")
                return
            }
            self.drinks = drinks ?? []
            self.output?.needUpdateTableView()
        }
    }
}
