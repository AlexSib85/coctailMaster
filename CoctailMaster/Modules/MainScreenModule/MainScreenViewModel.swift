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

    init(dataService: DataService) {
        self.dataService = dataService
    }

    func viewLoaded() {
        loadData()
    }

    private func loadData() {
        dataService.getIngridientList { ingridients, error in
            if let error = error {
                print("Error!!!!!!!!!!!!!!!!! \(error)")
                return
            }
            print(ingridients)
        }
        dataService.getRandomDrink { drink, error in
            if let error = error {
                print("Error!!!!!!!!!!!!!!!!! \(error)")
                return
            }
            print(drink)
        }
    }
}
