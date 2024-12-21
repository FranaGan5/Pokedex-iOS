//
//  RegistrarEmailView.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 16/12/24.
//

import SwiftUI

struct RegistrarEmailView: View {
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
        @State var textFieldEmail: String = ""
        @State var textFieldContrasena: String = ""
    var body: some View {
        ZStack{
            Color(Colors.azulPastel.rawValue)
                .ignoresSafeArea()
                .opacity(0.3)
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
                    autentificacionViewModel.crearNuevoUsuario(email: textFieldEmail, contrasena: textFieldContrasena)
                }
                .padding(.top, 20)
                .buttonStyle(.bordered)
                .tint(.green)
                if let mensajeError = autentificacionViewModel.mensajeError{
                    Text(mensajeError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            Spacer()
        }
    }
        }
}

#Preview {
    RegistrarEmailView(autentificacionViewModel: AutentificacionViewModel())
}
