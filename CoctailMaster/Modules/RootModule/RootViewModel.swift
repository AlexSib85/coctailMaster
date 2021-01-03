//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

class RootViewModel {

    func viewLoaded() {
        loadData()
    }

    private func loadData() {
        NetworkManager.shared.loadList()
    }
}
