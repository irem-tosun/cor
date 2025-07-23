//
//  Cart.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//


import Foundation

struct Cart: HTTPResponseProtocol {
    typealias HTTPEntityType = Cart.Type

    let id: Int
    let userId: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case id, userId, products
    }
}
