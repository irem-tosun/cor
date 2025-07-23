//
//  APIRequestBuilder.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation

protocol APIRequestBuilder {
    associatedtype Body
    
    func setMethod(_ method: HttpMethod) -> Self
    func addHeader(key: String, value: String) -> Self
    func addParameter(key: String, value: String) -> Self
    func setBody(_ body: Body) -> Self
    func build() -> APIRequest<Body>
    func setContentType(contentType: ContentType) -> Self
}

final class APIRequestBuilderImpl<T>: APIRequestBuilder {
    private var endpoint: URL
    private var method: HttpMethod = .get
    private var headers: [String: String] = [:]
    private var parameters: [String: String] = [:]
    private var body: T?
    private var contentType: ContentType?

    init(_ endpoint: URL) {
        self.endpoint = endpoint
    }

    func setMethod(_ method: HttpMethod) -> Self {
        self.method = method
        return self
    }

    func addHeader(key: String, value: String) -> Self {
        headers[key] = value
        return self
    }

    func addParameter(key: String, value: String) -> Self {
        parameters[key] = value
        return self
    }

    func setBody(_ body: T) -> Self {
        self.body = body
        return self
    }

    func setContentType(contentType: ContentType) -> Self {
        self.contentType = contentType
        return self
    }

    func build() -> APIRequest<T> {
        return APIRequest(endpoint: endpoint, method: method, headers: headers, parameters: parameters, body: body, contentType: contentType)
    }
}

enum ContentType: String {
    case json = "application/json"
    case xml = "application/xml"
    case formURLEncoded = "application/x-www-form-urlencoded"
    case multipartFormData = "multipart/form-data"
    case plainText = "text/plain"
}
