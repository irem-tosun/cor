//
//  CartRequest.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 13.05.2025.
//

import Observation

@Observable final class CartRequest {
    private let applicationManager: ApplicationManager = ApplicationManager.shared
    private(set) var product: Product?
    
    init(product: Product?) {
        self.product = product
    }
    
    var isUserLoggedIn: Bool {
        applicationManager.isUserLoggedIn
    }
    
    func addProduct(_ product: Product) {
        self.product = product
    }
}
