//
//  MediaViewModel.swift
//  Pokedex
//
//  Created by FranaGan on 22/3/25.
//
import Foundation

@MainActor
final class MediaViewModel: ObservableObject {
    func logOut(authViewModel: AuthViewModel) {
        do {
            try AuthenticationManager.shared.signOut()
            authViewModel.user = nil
        } catch {
            print("❌ Error al cerrar sesión: \(error.localizedDescription)")
        }
    }
}
