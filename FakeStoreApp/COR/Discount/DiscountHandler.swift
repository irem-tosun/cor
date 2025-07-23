//
//  DiscountHandler.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 13.05.2025.
//

protocol DiscountHandler {
    var next: DiscountHandler? { get set }
    
    func applyDiscount(cartTotal: CartTotal, discountConfig: DiscountRequest)
}

struct DiscountRequest {
    let isNewCustomer: Bool
    let isSeasonalSale: Bool
    let codeConfirmed: Bool
    let moreThan10Items: Bool
    let applyAllDiscounts: Bool
}

final class CartTotal {
    var total: Double
    
    init(total: Double = 0) {
        self.total = total
    }
}
