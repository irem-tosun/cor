//
//  StoreViewModel.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation
import Observation

@Observable final class StoreViewModel {
    var resultText: String?
    private var handlerChain: (any CartHandler)?
    
    func configureHandlerChainIfNeeded(loginService: LoginService, cartService: CartService) {
        guard handlerChain == nil else {
            return
        }
        self.handlerChain = CartFlowChainBuilder(loginService: loginService, cartService: cartService).buildChain()
    }
    
    func addToCart(product: Product) async throws {
        let request = CartRequest.init(product: product)
        try await handlerChain?.handle(cartRequest: request)
    }  
}
