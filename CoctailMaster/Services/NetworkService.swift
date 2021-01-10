//
//  NetworkManager.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 18.11.2020.
//

import Alamofire

enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case connectionError
}

protocol NetworkService {
    func loadIngridientList(closure: @escaping ([Ingridient]?, Error?) -> Void)
    func loadRandom(closure: @escaping (Drink?, Error?) -> Void)
}

class NetworkServiceImpl: NetworkService {

    func loadIngridientList(closure: @escaping ([Ingridient]?, Error?) -> Void) {
        AF.request(RequestList.ingridientsList)
            .responseDecodable(of: Ingridients.self) { response in
                if let error = response.error {
                    closure(nil, error)
                    return
                }
                guard let ingridients = response.value else {
                    closure(nil, NetworkError.invalidResponse)
                    return
                }
                closure(ingridients.ingridients, nil)
            }
    }

    func loadRandom(closure: @escaping (Drink?, Error?) -> Void) {
        AF.request(RequestList.randomCoctail)
            .responseDecodable(of: Drinks.self) { response in
                if let error = response.error {
                    closure(nil, error)
                    return
                }
                guard let drinks = response.value, let drink = drinks.drinks.first else {
                    closure(nil, NetworkError.invalidResponse)
                    return
                }
                closure(drink, nil)
            }
    }
}
