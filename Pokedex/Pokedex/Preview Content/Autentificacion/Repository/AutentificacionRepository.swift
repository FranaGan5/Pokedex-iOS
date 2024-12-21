//
//  AutenticacionRepository.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 21/12/24.
//

import Foundation

final class AutenticacionRepository{
    private let autentificacionFirebaseDataSource: AutentificacionFirebaseDataSource
    init(autentificacionFirebaseDataSource: AutentificacionFirebaseDataSource = AutentificacionFirebaseDataSource()) {
        self.autentificacionFirebaseDataSource = autentificacionFirebaseDataSource
    }
    func usuarioActivo() -> Usuario?{
        autentificacionFirebaseDataSource.usuarioActivo()
    }
    func crearNuevoUsuario(email: String, contrasena: String, completionBlock: @escaping (Result<Usuario, Error>) -> Void){
        autentificacionFirebaseDataSource.crearNuevoUsuario(email: email, contrasena: contrasena, completionBlock: completionBlock)
    }
    
    func login(email: String, contrasena: String, completionBlock: @escaping (Result<Usuario, Error>) -> Void){
        autentificacionFirebaseDataSource.login(email: email, contrasena: contrasena, completionBlock: completionBlock)
    }
    
    func logOut() throws{
        try autentificacionFirebaseDataSource.logOut()
    }
}
