//
//  PokedexApp.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 3/12/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct PokedexApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var autentificacionViewModel = AutentificacionViewModel()
    var body: some Scene {
        WindowGroup {
            //Usuario creado o logueado va a la pantalla principal
            if let usuario = autentificacionViewModel.usuario{
                TabViewMain(autentificacionViewModel: autentificacionViewModel)
                
            }else{
                //Usuario nuevo se le muestra la pantalla de registro
                AuthenticationView(autentificacionViewModel: autentificacionViewModel)
            }
        }
    }
}
