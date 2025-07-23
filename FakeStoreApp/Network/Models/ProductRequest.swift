//
//  ProductRequest.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation

struct ProductRequest: HTTPRequestProtocol {
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: Category?
    
    enum CodingKeys: String, CodingKey {
        case title, price, description, category, image
    }
}
