//
//  PokedexApp.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

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
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var favoritesManager = FavoritesPokemonManager()

    var body: some Scene {
        WindowGroup {
            if authViewModel.user != nil {
                TabViewMain()
                    .environmentObject(favoritesManager)
            } else {
                AuthenticationView()
            }
        }
    }
}

