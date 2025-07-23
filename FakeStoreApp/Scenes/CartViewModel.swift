//
//  CartViewModel.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 13.05.2025.
//


import Foundation
import Observation

@Observable final class CartViewModel {
    var handlerChain: (any DiscountHandler)?
    var cartTotal: CartTotal?
    
    func applyDiscount(total: Double) {
        let config = DiscountRequest(isNewCustomer: true, isSeasonalSale: true, codeConfirmed: true, moreThan10Items: true, applyAllDiscounts: false)
        cartTotal = CartTotal.init(total: total)
        handlerChain = DiscountChainBuilder().buildChain()
        
        guard let cartTotal else { return }
        handlerChain?.applyDiscount(cartTotal: cartTotal, discountConfig: config)
    }
}
