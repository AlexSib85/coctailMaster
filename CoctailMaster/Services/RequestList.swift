//
//  RequestList.swift
//  CoctailMaster
//
//  Created by Alexandr Protasov on 10.01.2021.
//

import Alamofire

enum RequestList: URLRequestConvertible {

    case randomCoctail
    case ingridientsList
    case drinksListByIngridient(String)

    #if RELEASE
    static let baseURL = Constant.ServerURL.prod
    #else
    static let baseURL = Constant.ServerURL.debug
    #endif

    private var urlEncoder: URLEncoding {
        return URLEncoding.default
    }

    private var jsonEncoder: JSONEncoding {
        return JSONEncoding.default
    }

    var method: Alamofire.HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .randomCoctail:
            return "/1/random.php"
        case .ingridientsList:
            return "/1/list.php?i=list"
        case .drinksListByIngridient(let ingridient):
            return "/1/filter.php?i=\(ingridient)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
    }

    func asURLRequest() throws -> URLRequest {
        guard let requestUrl = URL(string: RequestList.baseURL + path), var request = try? URLRequest(url: requestUrl, method: method) else {
            throw NetworkError.invalidRequest
        }

        switch self {
        case .randomCoctail,
             .ingridientsList,
             .drinksListByIngridient:
            request = try urlEncoder.encode(request, with: [:])
        }
        return request
    }
}
