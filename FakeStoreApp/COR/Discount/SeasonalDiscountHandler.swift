//
//  SeasonalDiscountHandler.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 13.05.2025.
//

final class SeasonalDiscountHandler: DiscountHandler {
    var next: (any DiscountHandler)?
    
    func applyDiscount(cartTotal: CartTotal, discountConfig: DiscountRequest) {
        if discountConfig.isSeasonalSale {
            cartTotal.total -= 20
            if !discountConfig.applyAllDiscounts { return }
        }
        next?.applyDiscount(cartTotal: cartTotal, discountConfig: discountConfig)
    }
}
