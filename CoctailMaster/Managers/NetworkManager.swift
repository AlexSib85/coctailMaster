//
//  NetworkManager.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    private init() {

    }

    let path: String = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    let path2 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"

    func loadList() {
        AF.request(path).response { response in
            debugPrint(response)
        }
    }
}
