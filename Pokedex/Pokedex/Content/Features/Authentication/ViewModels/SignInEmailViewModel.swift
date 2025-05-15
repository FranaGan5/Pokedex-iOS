//
//  SignInEmailViewModel.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 22/3/25.
//

import Foundation

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
