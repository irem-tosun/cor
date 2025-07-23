//
//  LoginView.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var successMessage: String = ""
    @State private var viewModel = LoginViewModel()
    @Environment(\.navigator) private var navigator: NavigationManager
    @Environment(\.loginService) private var loginService: LoginService
    @Environment(\.cartService) private var cartService: CartService
    let showRegisterView: (() -> Void)?
    
    private var isFormValid: Bool {
        !username.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }

    var body: some View {
        ZStack(alignment: .top) {
            Image("login")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()

            VStack {
                Group {
                    loginForm
                }
                .frame(maxHeight: 230)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(.top, 400)
                .padding()
            }
            .padding()
        }
    }

    @ViewBuilder private var loginForm: some View {
        Form {
            if !errorMessage.isEmptyOrWhiteSpace {
                Text(errorMessage).foregroundColor(.red)
            }

            if !successMessage.isEmptyOrWhiteSpace {
                Text(successMessage).foregroundColor(.blue)
            }

            TextField("Username", text: $username).textInputAutocapitalization(.never)
            SecureField("Password", text: $password).textInputAutocapitalization(.never)

            HStack {
                Button(action: {
                    Task {
                        do {
                            try await viewModel.login(loginService: loginService, cartService: cartService)
                            successMessage = "Logged in successfully!"
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                    }
                }) {
                    Text("Login")
                }
                .disabled(!isFormValid)

                Spacer()

                Text("Don't you have an account?")
                    .foregroundColor(.black)
                    .onTapGesture {
                        showRegisterView?()
                    }
            }
        }
        .scrollContentBackground(.hidden)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showRegisterView:  {
            print("do nothing")
        })
            .environment(LoginService())
            .environment(NavigationManager.shared)
    }
}
