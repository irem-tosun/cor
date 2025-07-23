//
//  String+.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//

extension String {
    var isEmptyOrWhiteSpace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
