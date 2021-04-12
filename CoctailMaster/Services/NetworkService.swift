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
    func loadIngridientList(closure: @escaping (Ingridients?, Error?) -> Void)
    func loadRandomDrink(closure: @escaping (Drinks?, Error?) -> Void)
    func loadDrinkListBy(ingridient: String, closure: @escaping (Drinks?, Error?) -> Void)
}

class NetworkServiceImpl: NetworkService {

    func loadIngridientList(closure: @escaping (Ingridients?, Error?) -> Void) {
        loadRequest(request: RequestList.ingridientsList, closure: closure)
    }

    func loadRandomDrink(closure: @escaping (Drinks?, Error?) -> Void) {
        loadRequest(request: RequestList.randomCoctail, closure: closure)
    }

    func loadDrinkListBy(ingridient: String, closure: @escaping (Drinks?, Error?) -> Void) {
        loadRequest(request: RequestList.drinksListByIngridient(ingridient), closure: closure)
    }

    private func loadRequest<T: Decodable>(request: RequestList, closure: @escaping (T?, Error?) -> Void) {
        AF.request(request)
            .responseDecodable(of: T.self) { response in
                if let error = response.error {
                    closure(nil, error)
                    return
                }
                guard let drinks = response.value else {
                    closure(nil, NetworkError.invalidResponse)
                    return
                }
                closure(drinks, nil)
            }
    }
}
