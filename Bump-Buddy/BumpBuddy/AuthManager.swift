//
//  AuthManager.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import Foundation

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    func login(username: String, password: String) {
        // Implement login logic
        // On successful login, set isAuthenticated to true
    }

    func logout() {
        // Implement logout logic
        // Set isAuthenticated to false
    }

    func checkAuthentication() {
        // Implement a check to determine if the user is already authenticated
        // Update isAuthenticated accordingly
    }
}
