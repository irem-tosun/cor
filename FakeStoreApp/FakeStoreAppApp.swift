//
//  FakeStoreAppApp.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import SwiftUI

@main
struct FakeStoreAppApp: App {
    @State private var navigator = NavigationManager.shared
    @State private var presentLogin = true
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigator.routes) {
                MainView()
                    .environment(navigator)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .login:
                            LoginView() {
                                
                            }
                            .environment(CartRequest(product: nil))
                        case .register:
                            RegisterView()
                        case .cart:
                            CartView()
                        }
                     }
            }
            .sheet(item: $navigator.presentedSheet) { sheet in
                switch sheet {
                case .login:
                    LoginView() {
                            navigator.presentedSheet = .register
                        }
                case .register:
                    RegisterView()
                }
            }
        }
    }
}
