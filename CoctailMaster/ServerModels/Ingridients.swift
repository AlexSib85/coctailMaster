//
//  Ingridients.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 10.01.2021.
//

import Foundation

struct Ingridients: Codable {

    var ingridients: [Ingridient] = []

    init(ingridients: [Ingridient] = []) {
        self.ingridients = ingridients
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case ingridients = "drinks"
    }
}
