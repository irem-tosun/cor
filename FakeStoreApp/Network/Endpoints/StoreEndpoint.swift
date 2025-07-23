//
//  Untitled.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

struct StoreFakeAPI {
    enum Endpoint {
        private static let baseURL: String = "https://fakestoreapi.com/"

        case allProducts(limit: Int)
        case login
        case register
        case addCart
        
        var url: String {
            switch self {
            case .allProducts(let limit):
                return "\(Self.baseURL)products?limit=\(limit)"
            case .login:
                return "\(Self.baseURL)auth/login"
            case .register:
                return "\(Self.baseURL)users"
            case .addCart:
                return "\(Self.baseURL)carts"
            }
        }
    }
}
