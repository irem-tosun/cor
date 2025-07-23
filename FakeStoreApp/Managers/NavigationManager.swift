//
//  NavigationManager.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 16.04.2025.
//

import Foundation
import Observation

@Observable final class NavigationManager {
    var routes: [Route]
    var presentedSheet: SheetRoute?

    static let shared = NavigationManager()

    private init() {
        routes = []
        presentedSheet = nil
    }

    func navigate(to route: Route) {
        routes.append(route)
    }

    func navigateBack() {
        routes.removeLast()
    }

    func presentSheet(_ sheet: SheetRoute) {
        presentedSheet = sheet
    }

    func dismissSheet() {
        presentedSheet = nil
    }
}

enum Route: Hashable {
    case login
    case register
    case cart
}

enum SheetRoute: Identifiable, Hashable {
    case login, register

    var id: String {
        switch self {
        case .login: return "login"
        case .register: return "register"
        }
    }
}
