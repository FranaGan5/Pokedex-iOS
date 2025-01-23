//
//  LoginEmailView.swift
//  Pokedex
//
//  Created by FranaGan on 11/12/24.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
    @State var textFieldEmail: String = ""
    @State var textFieldContrasena: String = ""
    @State var mostrarContrasena: Bool = false
    
    var body: some View {
        ZStack {
            Color(Colors.amarillo.rawValue)
                .ignoresSafeArea()

            VStack(alignment: .center) {
                CerrarView()
                    .padding(.top, 20)
                
                VStack(spacing: 40) {
                        
                    Text("¡Bienvenido!")
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .bold()
                            .foregroundColor(.black)
                            .frame(maxWidth: 180 , alignment: .center)
                            .padding(.horizontal, 30)
                    
                    HStack{
                        TextField("Email", text: $textFieldEmail)
                            .padding(.leading, 10)
                            .frame(width: 300, height: 40)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color(.black), lineWidth: 2))
                    }
           
                    HStack {
                        Group {
                            if mostrarContrasena {
                                TextField("Contraseña", text: $textFieldContrasena)
                                    .padding(.leading, 10)
                            } else {
                                SecureField("Contraseña", text: $textFieldContrasena)
                                    .padding(.leading, 10)
                            }
                        }
                        .frame(height: 40)
                        .cornerRadius(6)
                        Button(action:{
                            mostrarContrasena.toggle()
                        }){
                            Image(systemName: mostrarContrasena ? "eye" : "eye.slash")
                                .foregroundStyle(.gray)
                                .padding(.trailing, 10)
                                
                        }
                    }.frame(width: 300)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(.black), lineWidth: 2)
                    )
                    
                    HStack {
                        Button(action: {
                            autentificacionViewModel.login(email: textFieldEmail, contrasena: textFieldContrasena)
                        }) {
                            Text("Acceder")
                                .font(.headline)
                                .padding(5)
                                .foregroundStyle(.black)
                                .frame(maxWidth: 300)
                                .frame(height: 40)
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                        .bold()
                        .foregroundStyle(.black)
                        .padding(5)
                        .frame(width: 300, height: 40)
                        .frame(maxWidth: 300)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.top, 40)
                Spacer()
            }
        }
    }
}


#Preview {
    LoginEmailView(autentificacionViewModel: AutentificacionViewModel())
}
