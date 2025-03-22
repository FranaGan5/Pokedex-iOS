//
//  RegisterViewModel.swift
//  Pokedex
//
//  Created by FranaGan on 22/3/25.
//
import Foundation

@MainActor
final class RegisterEmailViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    func register() {
        guard !email.isEmpty, !password.isEmpty else {
            print("Email o contraseña no encontrados")
            return
        }
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared
                    .createUser(email: email, password: password)
                print("Success")
            } catch {
                print("Error: \(error)")
            }
        }
    }

}
