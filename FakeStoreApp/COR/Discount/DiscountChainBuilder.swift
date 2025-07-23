//
//  DiscountChainBuilder.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 13.05.2025.
//

final class DiscountChainBuilder {
    
    func buildChain() -> DiscountHandler {
        let newCustomerDiscountHandler = NewCustomerDiscountHandler()
        let seasonalDiscountHandler = SeasonalDiscountHandler()
        let couponDiscountHandler = CouponDiscountHandler()
        let bulkDiscountHandler = BulkDiscountHandler()
        
        newCustomerDiscountHandler.next = seasonalDiscountHandler
        seasonalDiscountHandler.next = couponDiscountHandler
        couponDiscountHandler.next = bulkDiscountHandler
        
        return newCustomerDiscountHandler
    }
}
