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
}

//This service intented to be used for caching data
class DataServiceImpl: DataService {
    private var networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
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
            if let rootDrinks = rootDrinks, let drink = rootDrinks.drinks.first {
                closure(drink, nil)
            } else {
                closure(nil, error)
            }
        }
    }
}
