//
//  LoginHandler.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

final class LoginHandler: CartHandler {
    var next: (any CartHandler)?
    
    private let networkService: LoginService

    init(_ networkService: LoginService) {
        self.networkService = networkService
    }
    
    func handle(cartRequest: CartRequest) async throws {
        guard cartRequest.isUserLoggedIn else {
            networkService.pendingCartRequest = cartRequest
            
            print("🔒 User is not logged in. Redirecting to login screen.")
            NavigationManager.shared.presentSheet(.login)
            return // Stop the chain until login
        }
        
        print("🔓 User is already logged in. Continue to the next step in the chain")
        try await next?.handle(cartRequest: cartRequest)
    }
}
