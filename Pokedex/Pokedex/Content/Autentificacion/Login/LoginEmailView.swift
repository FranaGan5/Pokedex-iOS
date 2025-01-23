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
            VStack {
                Spacer()
                ZStack {
                    VStack {
                        Rectangle()
                            .frame(height: 40)
                            .foregroundStyle(Color(Colors.marron.rawValue))
                        Rectangle()
                            .frame(height: 40)
                            .foregroundStyle(Color(Colors.marron.rawValue))
                            .padding(.top, 30)
                    }
                    Spacer()
                    Image("cola-pikachu")
                        .resizable()
                        .frame(width: 350, height: 390)
                        .padding(.top, 50)
                }
            }

            VStack(alignment: .center) {
                CerrarView()
                    .padding(.top, 20)
                
                VStack(spacing: 40) {
                    HStack {
                        Text("¡Bienvenido!")
                            .font(.system(size: 28, weight: .bold, design: .default))
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .frame(maxWidth: 300)
                    
                    HStack {
                        TextField("Email", text: $textFieldEmail)
                            .frame(height: 40)
                            .padding(.leading, 10)
                    }
                    .background(.white)
                    .frame(maxWidth: 300)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(.black), lineWidth: 2)
                    )
                    
                    
                    HStack {
                        if mostrarContrasena{
                            TextField("Contraseña", text: $textFieldContrasena)
                                .frame(height: 40)
                                .padding(.leading, 10)
                        }else{
                            SecureField("Contraseña", text: $textFieldContrasena)
                                .frame(height: 40)
                                .padding(.leading, 10)
                        }
                        Button(action:{
                            mostrarContrasena.toggle()
                        }){
                            Image(systemName: mostrarContrasena ? "eye" : "eye.slash")
                                .foregroundStyle(.gray)
                                .padding(.trailing, 10)
                        }
                        
                    }
                    .background(.white)
                    .frame(maxWidth: 300)
                    .cornerRadius(6)
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
