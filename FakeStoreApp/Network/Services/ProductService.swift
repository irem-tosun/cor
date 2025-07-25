//
//  ProductService.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation
import Observation

@Observable final class ProductService: CoreNetworkService<Product> {
    private(set) var products: [Product] = []

    func getAll() async throws {
        guard let url = URL(string: StoreFakeAPI.Endpoint.allProducts(limit: 100).url) else {
            throw HTTPError.invalidRequest
        }

        // Building the url request with builder pattern
        let apiRequest = APIRequestBuilderImpl<Data>(url)
            .setMethod(.get)
            .build()

        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        do {
            products = try await callAPIForMultipleResults(urlRequest)
        } catch {
            if let decodingError = error as? DecodingError {
                // Handle specific decoding errors
                switch decodingError {
                case let .typeMismatch(type, context):
                    print("Type mismatch error: \(type), context: \(context.debugDescription).")
                case let .valueNotFound(type, context):
                    print("Value not found error: \(type), context: \(context.debugDescription).")
                case let .keyNotFound(key, context):
                    print("Key not found error: \(key), context: \(context.debugDescription).")
                case let .dataCorrupted(context):
                    print("Data corrupted error: \(context.debugDescription).")
                @unknown default:
                    print("Unknown decoding error: \(decodingError.localizedDescription).")
                }
            }
        }
    }
}
