//
//  Drinks.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Foundation

struct Drinks: Codable {

    var drinks: [Drink]?

    init(drinks: [Drink]?) {
        self.drinks = drinks
    }
}
