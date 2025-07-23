//
//  StringResponse.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 17.04.2025.
//

//struct StringResponse: HTTPResponseProtocol {
//    typealias HTTPEntityType = String.Type
//    
//    let token: String
//
//    enum CodingKeys: String, CodingKey {
//        case value
//    }
//}

struct LoginResponse: HTTPResponseProtocol {
    typealias HTTPEntityType = LoginResponse.Type
    
    let token: String

    enum CodingKeys: String, CodingKey {
        case token
    }
}
