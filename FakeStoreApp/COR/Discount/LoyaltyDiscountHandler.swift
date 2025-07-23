//
//  LoyaltyDiscountHandler.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 13.05.2025.
//

final class NewCustomerDiscountHandler: DiscountHandler {
    var next: (any DiscountHandler)?
    
    func applyDiscount(cartTotal: CartTotal, discountConfig: DiscountRequest) {
        if discountConfig.isNewCustomer {
            cartTotal.total *= 0.9
            if !discountConfig.applyAllDiscounts { return }
        }
        next?.applyDiscount(cartTotal: cartTotal, discountConfig: discountConfig)
    }
}
