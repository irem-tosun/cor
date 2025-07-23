//
//  ProductResponse.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation

struct ProductResponse: HTTPResponseProtocol {
    typealias HTTPEntityType = ProductResponse.Type

    let id: Int
    let title: String?
    let price: String?
    let description: String?
    let category: Category?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, image
    }
}
