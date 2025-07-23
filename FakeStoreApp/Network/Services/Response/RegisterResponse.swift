//
//  RegisterResponse.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//

struct RegisterResponse: HTTPResponseProtocol {
    typealias HTTPEntityType = RegisterResponse.Type
    
    let id: Int
}
