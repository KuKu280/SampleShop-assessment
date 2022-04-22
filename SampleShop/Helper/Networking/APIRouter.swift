//
//  APIRouter.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import Foundation

enum APIRouter: APIConfiguration {

    case login(_ loginRequest: LoginRequestModel)
    case getProducts(_ productsRequest: ProductsRequestModel)

    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "assessment-api.hivestage.com"
        return urlComponents
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getProducts:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/auth/login"
        case .getProducts:
            return "/api/products"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getProducts(let productQueryData):
            return productQueryData.asDictionary.map { URLQueryItem(name: $0.key, value: $0.value as? String) }
        default:
            return nil
        }
    }

    var parameters: Parameters? {
        switch self {
        case .login(let loginRequest):
            return loginRequest.asDictionary
        default:
            return nil
        }
    }

    var isToken: Bool {
        switch self {
        case .getProducts:
            return true
        default:
            return false
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var urlComponents = self.urlComponents
        urlComponents.path = path
        
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else { throw APIError.InvalidURL }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if isToken {
            guard let token = UserDefaults.standard.string(forKey: "Token") else {
                throw APIError.cantNotRetriveToken
            }
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let parameters = parameters {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { throw APIError.canNotProcessData }
            urlRequest.httpBody = httpBody
        }
        debugPrint(urlRequest)
        return urlRequest
    }
    
}
