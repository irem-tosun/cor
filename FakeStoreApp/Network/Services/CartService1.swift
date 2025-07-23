////
////  CartService.swift
////  FakeStoreApp
////
////  Created by İrem Tosun on 18.04.2025.
////
//
//import Foundation
//import Observation
//
//@Observable final class CartService1: CoreNetworkService<Cart> {
//    private(set) var response: Cart?
//
//    func addCart(cart: Cart) async throws {
//        guard let url = URL(string: StoreFakeAPI.Endpoint.addCart.url) else {
//            throw HTTPError.invalidRequest
//        }
//        let data = try JSONEncoder().encode(cart)
//        // Building the url request with builder pattern
//        let apiRequest = APIRequestBuilderImpl<Data>(url)
//            .setMethod(.post)
//            .setBody(data)
//            .setContentType(contentType: .json)
//            .build()
//
//        guard let urlRequest = apiRequest.getURLRequest() else {
//            throw HTTPError.invalidRequest
//        }
//        do {
//            response = try await callAPI(urlRequest)
//        } catch {
//            if let decodingError = error as? DecodingError {
//                // Handle specific decoding errors
//                switch decodingError {
//                case let .typeMismatch(type, context):
//                    print("Type mismatch error: \(type), context: \(context.debugDescription).")
//                case let .valueNotFound(type, context):
//                    print("Value not found error: \(type), context: \(context.debugDescription).")
//                case let .keyNotFound(key, context):
//                    print("Key not found error: \(key), context: \(context.debugDescription).")
//                case let .dataCorrupted(context):
//                    print("Data corrupted error: \(context.debugDescription).")
//                @unknown default:
//                    print("Unknown decoding error: \(decodingError.localizedDescription).")
//                }
//            }
//        }
//    }
//}
