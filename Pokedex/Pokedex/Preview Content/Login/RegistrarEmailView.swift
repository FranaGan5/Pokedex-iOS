//
//  RegistrarEmailView.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 16/12/24.
//

import SwiftUI

struct RegistrarEmailView: View {
        @State var textFieldEmail: String = ""
        @State var textFieldContrasena: String = ""
    var body: some View {
        ZStack{
            Color.cyan
                .ignoresSafeArea()
                .opacity(0.2)
            Image("bulbasur")
                .resizable()
                .frame(width: 100, height: 100)
        VStack{
            CerrarView()
                .padding(.bottom, 40)
                .padding(.top, 20)
            
            Group{
                Text("Bienvenido al proceso de registro 🟢")
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .tint(.primary)
            .font(.headline)
            Group{
                Text("Introduce un correo y contraseña")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                
                TextField("Entrenador@pokedex.com", text: $textFieldEmail)
                    .tint(.green)
                TextField("Contraseña", text: $textFieldContrasena)
                    .tint(.green)
                
                Button("Aceptar"){
                    print("Aceptar")
                }
                .padding(.top, 20)
                .buttonStyle(.bordered)
                .tint(.green)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
        }
    }
        }
}

#Preview {
    RegistrarEmailView()
}
