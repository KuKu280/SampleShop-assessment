//
//  AllProductScreenEntity.swift
//  SampleShop
//
//  Created Ku Ku Zan on 19/04/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by Ku Ku Zan.
//

import Foundation

struct ProductsRequestModel: Codable {
    let page: String
    let size: String
}

extension ProductsRequestModel: DictionaryConvertible {
    var keyMappingDict: [String: String] {
        [
            "page": "page",
            "size": "size"
        ]
    }
}

struct ProductsResponseModel: Codable {
    let page: Int
    let size: Int
    let totalElements: Int
    let totalPages: Int
    let content: [Content]
}

struct Content: Codable {
    let amount: Int
    let category: Category
    let createdDate: String
    let description: String
    let id: Int
    let image: String
    let name: String
}

struct Category: Codable {
    let id: Int
    let createdDate: String
    let name: String
}
