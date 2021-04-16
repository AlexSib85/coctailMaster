//
//  DataService.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 10.01.2021.
//

import Foundation

protocol DataService {
    func getIngridientList(closure: @escaping ([Ingridient]?, Error?) -> Void)
    func getRandomDrink(closure: @escaping (Drink?, Error?) -> Void)
    func getDrinksListBy(ingridient: Ingridient, closure: @escaping ([Drink]?, Error?) -> Void)
    func searchDrinksBy(string: String, closure: @escaping ([DrinkModel]?, Error?) -> Void)
    func favoriteDrinks() -> [DrinkModel]
    func saveFavorite(drinks: [DrinkModel])
}

class DataServiceImpl: DataService {
    private var networkService: NetworkService
    private let drinksFileService: FileService<DrinkModel>

    init(networkService: NetworkService, drinksFileService: FileService<DrinkModel>) {
        self.networkService = networkService
        self.drinksFileService = drinksFileService
    }

    func getIngridientList(closure: @escaping ([Ingridient]?, Error?) -> Void) {

        networkService.loadIngridientList { rootIngridients, error in
            if let rootIngridients = rootIngridients {
                closure(rootIngridients.ingridients, nil)
            } else {
                closure(nil, error)
            }
        }
    }

    func getRandomDrink(closure: @escaping (Drink?, Error?) -> Void) {
        networkService.loadRandomDrink { rootDrinks, error in
            if let rootDrinks = rootDrinks, let drink = rootDrinks.drinks?.first {
                closure(drink, nil)
            } else {
                closure(nil, error)
            }
        }
    }

    func getDrinksListBy(ingridient: Ingridient, closure: @escaping ([Drink]?, Error?) -> Void) {
        guard let ingridientString = ingridient.strIngredient1 else {
            closure([], nil)
            return
        }
        networkService.loadDrinkListBy(ingridient: ingridientString) { rootDrinks, error in
            if let rootDrinks = rootDrinks {
                closure(rootDrinks.drinks, nil)
            } else {
                closure(nil, error)
            }
        }
    }

    func searchDrinksBy(string: String, closure: @escaping ([DrinkModel]?, Error?) -> Void) {
        networkService.searchDrinkBy(string: string) { rootDrinks, error in
            if let rootDrinks = rootDrinks?.drinks {
                var drinks = rootDrinks.map { DrinkModel(drink: $0) }
                let favoriteDrinks = self.favoriteDrinks()
                self.addFavoriteDrinks(drinks: &drinks, favorite: favoriteDrinks)
                closure(drinks, nil)
            } else {
                closure(nil, error)
            }
        }
    }

    func favoriteDrinks() -> [DrinkModel] {
        return drinksFileService.loadData()
    }

    func saveFavorite(drinks: [DrinkModel]) {
        drinksFileService.saveData(stored: drinks)
    }

    private func addFavoriteDrinks(drinks: inout [DrinkModel], favorite: [DrinkModel]) {
        drinks.indices.forEach {
            if favorite.contains(drinks[$0]) {
                drinks[$0].isFavorite = true
            }
        }
    }
}
