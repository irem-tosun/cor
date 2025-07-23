//
//  BaseInterceptor.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation

protocol CartHandler: AnyObject {
    var next: CartHandler? { get set }
    func handle( cartRequest: CartRequest) async throws
}
