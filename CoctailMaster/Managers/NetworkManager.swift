//
//  NetworkManager.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Alamofire

protocol NetworkManager {
    func loadList(closure: @escaping ([String]) -> Void)
}

class NetworkManagerImpl: NetworkManager {
    let path: String = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    let path2 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"

    func loadList(closure: @escaping ([String]) -> Void) {
        AF.request(path).response { response in
            debugPrint(response)
            closure(["1", "2"])
        }
    }
}
