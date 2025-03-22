//
//  AutentificacionViewModel.swift
//  Pokedex
//
//  Created by FranaGan on 21/12/24.
//

import Foundation
import FirebaseAuth
import SwiftUI

@MainActor
class AuthViewModel: ObservableObject {
    @Published var user: AuthDataResultModel?

    init() {
        self.user = try? AuthenticationManager.shared.getAuthenticatedUser()
        addAuthStateListener()
    }

    func addAuthStateListener() {
        Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                if let user = user {
                    self.user = AuthDataResultModel(user: user)
                } else {
                    self.user = nil
                }
            }
        }
    }

    func signIn(email: String, password: String) async {
        do {
            let authenticatedUser = try await AuthenticationManager.shared.signIn(email: email, password: password)
            DispatchQueue.main.async {
                self.user = authenticatedUser
            }
        } catch {
            print("❌ Error al iniciar sesión: \(error.localizedDescription)")
        }
    }

    func signOut() {
        do {
            try AuthenticationManager.shared.signOut()
            DispatchQueue.main.async {
                self.user = nil
            }
        } catch {
            print("❌ Error al cerrar sesión: \(error.localizedDescription)")
        }
    }
}
