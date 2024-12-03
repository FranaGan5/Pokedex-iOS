//
//  ContentView.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 3/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Text("Bienvenid@")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding(.leading, 150)
                    .frame(alignment: .trailing)
                Text("entrenador@")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .bold()
                    .padding(.leading, 200)
                    .frame(alignment: .trailing)
                
                ZStack{
                    Image("FondoPokeball")
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
