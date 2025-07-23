//
//  Ed.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import SwiftUI

extension EnvironmentValues {
    var navigator: NavigationManager {
        get { self[NavigationKey.self] }
        set { self[NavigationKey.self] = newValue }
    }
    
    var appManager: ApplicationManager {
        get { self[AppManagerKey.self] }
        set { self[AppManagerKey.self] = newValue }
    }
    
    var productService: ProductService {
        get { self[ProductServiceKey.self] }
        set { self[ProductServiceKey.self] = newValue }
    }
    
    var loginService: LoginService {
        get { self[LoginKey.self] }
        set { self[LoginKey.self] = newValue }
    }
    
    var register: RegisterService {
        get { self[RegisterKey.self] }
        set { self[RegisterKey.self] = newValue }
    }
    
    var cartService: CartService {
        get { self[CartKey.self] }
        set { self[CartKey.self] = newValue }
    }
}

private struct NavigationKey: EnvironmentKey {
    static var defaultValue: NavigationManager = NavigationManager.shared
}

private struct AppManagerKey: EnvironmentKey {
    static var defaultValue: ApplicationManager = ApplicationManager.shared
}

private struct LoginKey: EnvironmentKey {
    static var defaultValue: LoginService = LoginService()
}

private struct RegisterKey: EnvironmentKey {
    static var defaultValue: RegisterService = RegisterService()
}

private struct ProductServiceKey: EnvironmentKey {
    static var defaultValue: ProductService = ProductService()
}

private struct CartKey: EnvironmentKey {
    static var defaultValue: CartService = CartService()
}
