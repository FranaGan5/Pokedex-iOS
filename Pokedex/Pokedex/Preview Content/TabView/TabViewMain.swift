//
//  TabViewMain.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 3/12/24.
//

import SwiftUI

struct TabViewMain: View {
    var body: some View {
        TabView{
            NotificacionesView().tabItem{
                Label("Notificaciones", systemImage: "envelope.fill")
            }
            HomeView().tabItem{
                Label("Home", systemImage: "house.fill")
            }
            PerfilView().tabItem{
                Label("Perfil", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    TabViewMain()
}
