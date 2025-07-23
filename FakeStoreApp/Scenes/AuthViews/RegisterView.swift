//
//  RegisterView.swift
//  FakeStoreApp
//
//  Created by İrem Tosun on 18.04.2025.
//
import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @Environment(\.navigator) private var navigator: NavigationManager
    @Environment(\.register) private var service: RegisterService

    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && !username.isEmptyOrWhiteSpace
    }

    var body: some View {
        ZStack(alignment: .top) {
            Image("register")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()

            VStack {
                Group {
                    Form {
                        TextField("Username", text: $username).textInputAutocapitalization(.never)
                        TextField("Email", text: $email).textInputAutocapitalization(.never)
                        SecureField("Password", text: $password).textInputAutocapitalization(.never)
                        
                        HStack {
                            Button(action: {
                                Task {
                                    await signUp()
                                }
                            }) {
                                Text("Signup")
                            }
                            .disabled(!isFormValid)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                Text("Already have an account?")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }.frame(maxHeight: 250)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .padding(.top, 400)
        }
    }

    private func signUp() async {
        do {
            try await service.register(with: RegisterRequest(id: 1, username: username, email: email, password: password))
            
        } catch {
            print(error)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environment(RegisterService())
            .environment(NavigationManager.shared)
    }
}
