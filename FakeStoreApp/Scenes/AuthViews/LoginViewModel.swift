//
//  LoginViewModel.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 12.05.2025.
//

import Foundation
import Observation

@Observable final class LoginViewModel {
    var resultText: String?
    var handlerChain: (any CartHandler)?
    
    func login(loginService: LoginService, cartService: CartService) async throws {
        try await loginService.login(with: LoginRequest())
        
        if let request = loginService.pendingCartRequest {
            print(" ⛓ Rebuilding the chain")
            let chain = CartFlowChainBuilder(
                loginService: loginService,
                cartService: cartService
            ).buildChain()
            
            try await chain.handle(cartRequest: request)
            loginService.pendingCartRequest = nil
            NavigationManager.shared.dismissSheet()
        }
    }
}
