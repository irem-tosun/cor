//
//  LoginService.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation

@Observable final class LoginService: CoreNetworkService<LoginResponse> {
    private(set) var message: String = ""
    var pendingCartRequest: CartRequest?
    
    func login(with loginRequest: LoginRequest) async throws {
        message = "In progress.."

        guard let url = URL(string: StoreFakeAPI.Endpoint.login.url) else {
            throw HTTPError.invalidRequest
        }
        // Building the url request with builder pattern

        let data = try JSONEncoder().encode(loginRequest)

        let apiRequest = APIRequestBuilderImpl<Data>(url)
            .setMethod(.post)
            .setBody(data)
            .setContentType(contentType: .json)
            .build()

        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }

        let response = try await callAPI(urlRequest)
        if !response.token.isEmpty {
            ApplicationManager.shared.markUserAsLoggedIn(with: response.token)
        }
        message = "User logged in successfully!"
    }
}
