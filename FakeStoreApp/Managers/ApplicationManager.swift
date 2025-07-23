//
//  ApplicationManager.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//

import Observation

@Observable final class ApplicationManager {
    static let shared = ApplicationManager()
    private var token: String?
    
    private init() {
    }
    
    var isUserLoggedIn: Bool {
        guard let token else { return false }
        return !token.isEmpty
    }
    
    func markUserAsLoggedIn(with token: String) {
        self.token = token
    }
    
    func logout() {
        token = nil
    }
}
