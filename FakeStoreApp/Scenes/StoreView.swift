//
//  StoreView.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import SwiftUI

struct StoreView: View {
    private let listItems: [GridItem] = Array(repeating: .init(.fixed(CGFloat(100))), count: 3)
    @Environment(\.productService) private var productService
    @Environment(\.loginService) private var loginService
    @Environment(\.cartService) private var cartService
    @State private var viewModel = StoreViewModel()
     
    var body: some View {
        VStack {
            HeaderView(themeStyle: .fashion, title: "Store", subtitle: "Displaying you the Fake store products")

            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: listItems) {
                    ForEach(productService.products, id: \.self) { product in
                        getCell(for: product)
                            .padding(8)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: [.top])
        .onAppear {
            Task {
                try await productService.getAll()
            }
        }
    }

    @ViewBuilder private func getCell(for product: Product) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.lightSmoke)
                .shadow(radius: 2)
                .frame(width: 100, height: 170)

            VStack {
                Text(product.title)
                    .lineLimit(2, reservesSpace: true)
                    .font(.caption2)
                    .multilineTextAlignment(.center)

                RemoteImageView(url: product.image, contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 22))

                HStack {
                    Text("\(String(product.price)) \(Constants.dollarSign)")
                        .font(.caption2)
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 12, height: 12)
                        .onTapGesture {
                            viewModel.configureHandlerChainIfNeeded(loginService: loginService, cartService: cartService)
                            Task {
                                try await viewModel.addToCart(product: product)
                            }
                        }
                }
                .padding(6)
            }
        }
    }
}

#Preview {
    StoreView()
}
