//
//  RegistrarEmailView.swift
//  Pokedex
//
//  Created by FranaGan on 11/12/24.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    
    func signIn() {
            guard !email.isEmpty, !password.isEmpty else {
                errorMessage = "⚠️ Email o contraseña no pueden estar vacíos."
                return
            }
        
            
            Task {
                do{
                    let result = try await AuthenticationManager.shared.signIn(email: email, password: password)
                    print("Success")
                }catch{
                    print("Error: \(error)")
                }
            }
        }
}

struct SignInEmailView: View {

    @StateObject private var viewModel = SignInEmailViewModel()
    @State var displayPassword: Bool = false

    var body: some View {
        ZStack {
            Color(Colors.azul.rawValue)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                CerrarView()
                    .padding(.top, 20)

                VStack(spacing: 40) {

                    Text("¡Inicia sesión!")
                        .font(
                            .system(size: 28, weight: .bold, design: .default)
                        )
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: 180, alignment: .center)
                        .padding(.horizontal, 30)

                    HStack {
                        TextField("Email", text: $viewModel.email)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .padding(.leading, 10)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(.black), lineWidth: 2))
                    }
                    .padding(.horizontal, 30)

                    HStack {
                        Group {
                            if displayPassword {
                                TextField(
                                    "Contraseña", text: $viewModel.password
                                )
                                .padding(.leading, 10)
                                
                            } else {
                                SecureField(
                                    "Contraseña", text: $viewModel.password
                                )
                                .padding(.leading, 10)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        
                        Button(action: {
                            displayPassword.toggle()
                        }) {
                            Image(
                                systemName: displayPassword
                                    ? "eye" : "eye.slash"
                            )
                            .foregroundStyle(.gray)
                            .padding(.trailing, 10)

                        }
                    }
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color(.black), lineWidth: 2)
                        )
                        .padding(.horizontal, 30)

                    HStack {
                        Button(action: {
                            viewModel.signIn()
                        }) {
                            Text("Sign In")
                                .font(.headline)
                                .padding(5)
                                .foregroundStyle(.black)
                                
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .bold()
                        .foregroundStyle(.black)
                        .padding(5)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.white)
                        .padding(.horizontal, 30)
                        .cornerRadius(8)
                        .shadow(
                            color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.top, 40)
                Spacer()
            }
        }
    }
}

#Preview {
    SignInEmailView()
}
