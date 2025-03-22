//
//  Untitled.swift
//  Pokedex
//
//   Created by FranaGan on 21/12/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
  
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() {}

    // Obtener usuario autenticado 🙆🏽
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }

    // Crear usuario 🆕
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authResult.user)
    }

    // Iniciar sesión 🔓
    func signIn(email: String, password: String) async throws -> AuthDataResultModel {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authResult.user)
    }

    // Cerrar sesión 🔒
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
