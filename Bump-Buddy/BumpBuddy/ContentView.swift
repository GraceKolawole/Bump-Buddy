//
//  ContentView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authManager = AuthManager()

    var body: some View {
        if authManager.isAuthenticated {
            MainTabView()
        } else {
            LoginView(authManager: authManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
