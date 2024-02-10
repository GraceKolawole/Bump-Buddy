//
//  SignUpView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var authManager: AuthManager
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

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
                    Text("Create an Account")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 5)

                    // TextFields and SecureFields
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: signUpUser) {
                        Text("Sign Up")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
//            .navigationBarTitle("Create an Account", displayMode: .inline)
//            .foregroundColor(.white)
//            .shadow(color: .black, radius: 5)
        }
        .edgesIgnoringSafeArea(.all) // Ensuring the NavigationView covers the entire screen
    }

    private func signUpUser() {
        // Implement sign-up logic
        // On successful sign-up, update the AuthManager
        authManager.isAuthenticated = true
        // Further actions or navigation can be implemented here
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(authManager: AuthManager())
    }
}
