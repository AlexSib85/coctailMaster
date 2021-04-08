//
//  RootViewModel.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

protocol SearchScreenViewModelOutput: AnyObject {

}

class SearchScreenViewModel {

    private var dataService: DataService

    init(dataService: DataService) {
        self.dataService = dataService
    }

    func viewLoaded() {
        loadData()
    }

    private func loadData() {

    }
}
