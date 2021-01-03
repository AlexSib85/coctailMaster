//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

class RootViewModel {

    private var networkManager: NetworkManager = AppContainer.shared.resolve()

    func viewLoaded() {
        loadData()
    }

    private func loadData() {
        networkManager.loadList { strings in
            print(strings)
        }
    }
}
