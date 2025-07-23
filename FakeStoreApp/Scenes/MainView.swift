//
//  MainView.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//

import SwiftUI

struct MainView: View {
    @Environment(\.navigator) private var navigationManager
    @Environment(\.cartService) private var cartService
    
    var body: some View {
        TabView {
            StoreView()
                .padding(.bottom, 10)
                .tabItem {
                    Label("Store", systemImage: "person")
                }
            
            CartView()
                .padding(.bottom, 10)
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
        .toolbar {
            // Menu on the Left
            ToolbarItem(placement: .navigationBarLeading) {
                Menu {
                    Button("Login") {
                        navigationManager.navigate(to: .login)
                    }

                    Button("Register") {
                        navigationManager.navigate(to: .register)
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .imageScale(.large)
                        .foregroundColor(Color(.darkGreen))
                }
            }
            if ApplicationManager.shared.isUserLoggedIn {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        cartService.clearAll()
                        ApplicationManager.shared.logout()
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
