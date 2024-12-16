//
//  LoginEmailView.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 11/12/24.
//

import SwiftUI

struct LoginEmailView: View {
    @State var textFieldEmail: String = ""
    @State var textFieldContrasena: String = ""
    var body: some View {
        ZStack{
            Color.cyan
                .ignoresSafeArea()
                .opacity(0.3)
            VStack{
                Image("pikachu-01")
                    .resizable()
                    .frame(width: 180, height: 300)
                    .padding(.top, 150)
                    .padding(.leading, 100)
            }
            VStack{
                CerrarView()
                    .padding(.bottom, 40)
                    .padding(.top, 20)
                Group{
                    Text("Bienvenido entrenador 🟡")
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .tint(.primary)
                .font(.headline)
                Group{
                    Text("Loguéate para acceder a tu perfil")
                        .tint(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.top, 12)
                        .padding(.bottom, 12)
                    
                    TextField("Entrenador@pokedex.com", text: $textFieldEmail)
                    TextField("Contraseña", text: $textFieldContrasena)
                    
                    Button("Login"){
                        print("Login")
                    }
                    .padding(.top, 20)
                    .buttonStyle(.bordered)
                    .tint(.black)
                }
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 64)
                Spacer()
            }
        }
    }
    }

#Preview {
    LoginEmailView()
}
