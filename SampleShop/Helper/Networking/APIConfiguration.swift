//
//  APIConfiguration.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//

import Foundation

protocol APIConfiguration {
    var urlComponents: URLComponents { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var queryItems : [URLQueryItem]? { get }
    var parameters: Parameters? { get }
    var isToken: Bool {get}
    func asURLRequest() throws -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public typealias Parameters = [String: Any]

protocol DictionaryConvertible {
    var keyMappingDict: [String: String] { get }
}

extension DictionaryConvertible {
    var asDictionary : [String: Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.map({ (key: String?, value: Any) -> (String, Any)? in
            guard let key = key, key != "keyMappingDict", let dictKey = keyMappingDict[key] else { return nil }
            return (dictKey, value)
        }).compactMap { $0 })
        return dict
    }
}

extension Dictionary {
    var queryString: String {
        var output: String = ""
        forEach({ output += "\($0.key)=\($0.value)&" })
        output = String(output.dropLast())
        return output
    }
}
