//
//  RegisterService.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 17.04.2025.
//

import Foundation

@Observable final class RegisterService: CoreNetworkService<RegisterResponse> {
    var message: String = ""

    func register(with registerRequest: RegisterRequest) async throws {
        message = "In progress.."

        guard let url = URL(string: StoreFakeAPI.Endpoint.register.url) else {
            throw HTTPError.invalidRequest
        }
        // Building the url request with builder pattern

        let data = try JSONEncoder().encode(registerRequest)

        let apiRequest = APIRequestBuilderImpl<Data>(url)
            .setMethod(.post)
            .setBody(data)
            .setContentType(contentType: .formURLEncoded)
            .build()

        guard let urlRequest = apiRequest.getURLRequest() else {
            throw HTTPError.invalidRequest
        }
        
        try await callAPI(urlRequest)    
        message = "User registered successfully!"
    }
}
