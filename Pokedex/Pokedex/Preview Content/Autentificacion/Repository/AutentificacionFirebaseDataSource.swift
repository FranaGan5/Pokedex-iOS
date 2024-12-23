//
//  Untitled.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 21/12/24.
//

import Foundation
import FirebaseAuth

struct Usuario {
    let email: String
}
final class AutentificacionFirebaseDataSource{
    //Función para verificar si el usuario está activo
    func usuarioActivo() -> Usuario? {
        guard let email = Auth.auth().currentUser?.email else{
            return nil
        }
        return .init(email: email)
    }
    //Función para crear un nuevo usuario en Firebase
    func crearNuevoUsuario(email: String, contrasena: String, completionBlock: @escaping (Result<Usuario, Error>) -> Void){
        Auth.auth().createUser(withEmail: email, password: contrasena) { AuthDataResult, error in
            if let error = error {
                print("Error al crear nuevo usuario \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = AuthDataResult?.user.email ?? "No email"
            print("Nuevo usuario creado con el siguiente email: \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func login(email: String, contrasena: String, completionBlock: @escaping (Result<Usuario, Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: contrasena) { AuthDataResult, error in
            if let error = error {
                print("Error login \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = AuthDataResult?.user.email ?? "No email"
            print("Usuario logueado con el siguiente email: \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logOut() throws{
        try Auth.auth().signOut()
    }
}
