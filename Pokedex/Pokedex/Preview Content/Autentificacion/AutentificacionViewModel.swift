//
//  AutentificacionViewModel.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 21/12/24.
//

import Foundation

final class AutentificacionViewModel: ObservableObject{
    @Published var usuario: Usuario?
    @Published var mensajeError: String?
    private let autentificacionRepository: AutenticacionRepository
    
    init(autentificacionRepository: AutenticacionRepository = AutenticacionRepository()) {
        self.autentificacionRepository = autentificacionRepository
        usuarioActivo()
    }
    func usuarioActivo(){
        self.usuario = autentificacionRepository.usuarioActivo()
    }
    func crearNuevoUsuario(email: String, contrasena: String){
        autentificacionRepository.crearNuevoUsuario(email: email, contrasena: contrasena){ [weak self] result in
            switch result{
            case .success(let usuario):
                self?.usuario = usuario
            case .failure(let error):
                self?.mensajeError = error.localizedDescription
            }
        }
    }
    
    func login(email: String, contrasena: String){
        autentificacionRepository.login(email: email, contrasena: contrasena){ [weak self] result in
            switch result{
            case .success(let usuario):
                self?.usuario = usuario
            case .failure(let error):
                self?.mensajeError = error.localizedDescription
            }
        }
    }
    
    func logOut() {
        do{
            try autentificacionRepository.logOut()
            self.usuario = nil
        }catch{
            print("Error al cerrar sesion")
        }
    }
}
