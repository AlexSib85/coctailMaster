//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

class RootViewModel {

    private var networkService: NetworkService

    init(networkService: NetworkService) {
        print("init RootViewModel")
        self.networkService = networkService
    }

    func viewLoaded() {
        loadData()
    }

    private func loadData() {
        networkService.loadIngridientList { drinks, error in
            if let error = error {
                print("Error!!!!!!!!!!!!!!!!! \(error)")
                return
            }
            print(drinks)
        }
        networkService.loadRandom { drink, error in
            if let error = error {
                print("Error!!!!!!!!!!!!!!!!! \(error)")
                return
            }
            print(drink)
        }
    }
}
