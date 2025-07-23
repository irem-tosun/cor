//
//  RegisterRequest.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 17.04.2025.
//

struct RegisterRequest: Encodable {
    var id: Int
    var username: String
    var email: String
    var password: String
}
