//
//  CartFlowChainBuilder.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 17.04.2025.
//

final class CartFlowChainBuilder {
    let loginService: LoginService
    let cartService: CartService
    
    init(loginService: LoginService, cartService: CartService) {
        self.loginService = loginService
        self.cartService = cartService
    }
    
    func buildChain() -> CartHandler {
        let loginHandler = LoginHandler(loginService)
        let addToCartHandler = AddToCartHandler(cartService)

        loginHandler.next = addToCartHandler
        
        return loginHandler
    }
}
