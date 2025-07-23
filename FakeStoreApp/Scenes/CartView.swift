//
//  CartView.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//

import SwiftUI

struct CartView: View {
    @Environment(\.cartService) private var cartService: CartService
    @State private var viewModel = CartViewModel()
    
    var body: some View {
            VStack {
                HeaderView(themeStyle: .fashion, title: "Your Cart", subtitle: "")
                if cartService.groupedItems.isEmpty {
                    Spacer()
                    Text("🛒 Your cart is empty")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List(cartService.groupedItems) { item in
                        HStack(spacing: 16) {
                            RemoteImageView(url: item.image, contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))
                            
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text("Qty: \(item.quantity ?? 1)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Text(String(format: "$%.2f", item.price * Double(item.quantity ?? 1)))
                                .fontWeight(.semibold)
                        }
                    }
                
                    
                    Divider()
                    
                    HStack {
                        Button {
                            viewModel.applyDiscount(total: totalPrice)
                        } label: {
                            Text("Apply Discount Code")
                        }
                    }
                    
                    HStack {
                        Text("Total")
                            .font(.headline)
                        Spacer()
                        
                        if let totalWithDiscount = viewModel.cartTotal?.total {
                            Text(String(format: "$%.2f", totalWithDiscount))
                                .font(.title3)
                                .bold()
                                .foregroundColor(.red)
                        } else {
                            Text(String(format: "$%.2f", totalPrice))
                                .font(.title3)
                                .bold()
                        }
                    }
                    .padding()
                }
        }
        .ignoresSafeArea(edges: [.top])
    }
    
    private var totalPrice: Double {
        cartService.items.reduce(0) { $0 + ($1.price * Double($1.quantity ?? 1)) }
    }
}

#Preview {
    CartView()
}
