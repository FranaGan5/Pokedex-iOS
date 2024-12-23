//
//  ContentView.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Text("Bienvenid@ \(autentificacionViewModel.usuario?.email ?? "Hola entrenador")")
                    .foregroundStyle(.white)
                    .font(.body)
                    .bold()
                    .padding(.leading, 150)
                    .frame(alignment: .trailing)
                
                ZStack{
                    Image("FondoPokeball")
                }
                
            }
        }
    }
}

#Preview {
    HomeView(autentificacionViewModel: AutentificacionViewModel())
}
