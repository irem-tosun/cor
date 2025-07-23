//
//  Product.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation

struct Product: HTTPResponseProtocol, Identifiable {
    typealias HTTPEntityType = Product.Type

    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String
    let rating: Rating?
    var quantity: Int? = 1
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, image, rating
    }
}

enum Category: String, Codable, CaseIterable {
    case electronics
    case jewelery
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating

struct Rating: Codable {
    let rate: Double
    let count: Int

    enum CodingKeys: String, CodingKey {
        case rate, count
    }
}

extension Product: Hashable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
