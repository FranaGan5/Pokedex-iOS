//
//  TabViewMain.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import SwiftUI

struct TabViewMain: View {
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
    var body: some View {
        TabView{
            NotificacionesView().tabItem{
                Label("Multimedia", systemImage: "envelope.fill")
            }
            HomeView(autentificacionViewModel: autentificacionViewModel).tabItem{
                Label("", image: "pokebola")
                    
                    
            }
            PerfilView(autentificacionViewModel: autentificacionViewModel).tabItem{
                Label("Perfil", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    TabViewMain(autentificacionViewModel: AutentificacionViewModel())
}
