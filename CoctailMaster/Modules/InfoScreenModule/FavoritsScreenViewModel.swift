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

    func selectedCell(at index: Int) {
        if favoriteDrinks.indices.contains(index) {
            favoriteDrinks[index].toggleFavorite()
            dataService.saveFavorite(drinks: favoriteDrinks.filter { $0.isFavorite })
            //Удаление из массива данных здесь не стал добавлять и пользователь сможет вернуть напиток назад в избранное при неправильном тапе
            output?.needUpdateTableView()
        }
    }

    private func loadData() {
        favoriteDrinks = dataService.favoriteDrinks()
        output?.needUpdateTableView()
    }
}
