//
//  AddToCartHandler.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 17.04.2025.
//

final class AddToCartHandler: CartHandler {
    var next: (any CartHandler)?

    private let cartService: CartService

    init(_ cartService: CartService) {
        self.cartService = cartService
    }
    
    func handle(cartRequest: CartRequest) async throws  {
        print("🛒 Adding product to cart")
        guard let product = cartRequest.product else { return }
        
        cartService.addProduct(product)
        NavigationManager.shared.navigate(to: .cart)
    }
}
