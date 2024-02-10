//
//  LoginView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authManager: AuthManager
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggingIn: Bool = false

    var body: some View {
            NavigationView {
                ZStack {
                    // Background image as the bottom layer
                    Image("mumappbackground2") // Replace with your image name
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 20) {
                        Text("Bump Buddy")
                                                .font(.largeTitle)
                                                .padding(.top,50)
                                                .foregroundColor(.white)
                                                .shadow(color: .black, radius: 5)

                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    if isLoggingIn {
                        ProgressView()
                            .padding()
                    } else {
                        loginButton
                    }

                    NavigationLink(destination: SignUpView(authManager: authManager)) {
                                           Text("Don't have an account? Sign up")
                                               .foregroundColor(.blue)
                                       }
                                       .padding(.bottom, 30)
                                   }
                                   .padding()
                               }
                           }
                           .edgesIgnoringSafeArea(.all) // This ensures the NavigationView covers the entire screen
                       }

    private var loginButton: some View {
        Button(action: authenticateUser) {
            Text("Login")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }

    private func authenticateUser() {
        authManager.isAuthenticated = true
        //isLoggingIn = true
        // Add your actual authentication logic here
        // After authentication, update the AuthManager and isLoggingIn
        // Example: authManager.isAuthenticated = true
        // isLoggingIn = false
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authManager: AuthManager())
    }
}
