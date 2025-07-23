//
//  CartService.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 12.05.2025.
//


import Foundation
import Observation

@Observable final class CartService {
    private(set) var items: [Product] = []
    
    func addProduct(_ product: Product) {
        items.append(product)
    }
    
    func clearAll() {
        items.removeAll()
    }
    
    var groupedItems: [Product] {
            let grouped = Dictionary(grouping: items, by: { $0.id })
        return grouped.compactMap { (id, products) in
                var product = products.first
                product?.quantity = products.count
                return product
            }
        }
}
