//
//  RegistrarEmailView.swift
//  Pokedex
//
//  Created by FranaGan on 11/12/24.
//

import SwiftUI

struct RegisterEmailView: View {

    @StateObject private var viewModel = RegisterEmailViewModel()
    @State var displayPassword: Bool = false

    var body: some View {
        ZStack {
            Color.pokeRedF03
                .ignoresSafeArea()

            VStack(alignment: .center) {
                CloseView()
                    .padding(.top, 20)

                VStack(spacing: 40) {

                    Text("¡Registrate!")
                        .font(
                            .system(size: 28, weight: .bold, design: .default)
                        )
                        .bold()
                        .foregroundColor(.pokeWhiteFef)
                        .frame(maxWidth: 180, alignment: .center)
                        .padding(.horizontal, 30)

                    HStack {
                        TextField("Email", text: $viewModel.email)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .padding(.leading, 10)
                            .background(.pokeWhiteFef)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color(.pokeWhiteFef), lineWidth: 2))
                    }
                    .padding(.horizontal, 30)

                    HStack {
                        Group {
                            if displayPassword {
                                TextField(
                                    "Contraseña", text: $viewModel.password
                                )
                                .padding(.leading, 10)
                                
                            } else {
                                SecureField(
                                    "Contraseña", text: $viewModel.password
                                )
                                .padding(.leading, 10)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        
                        Button(action: {
                            displayPassword.toggle()
                        }) {
                            Image(
                                systemName: displayPassword
                                    ? "eye" : "eye.slash"
                            )
                            .foregroundStyle(.gray)
                            .padding(.trailing, 10)

                        }
                    }
                        .background(.pokeWhiteFef)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(.pokeWhiteFef), lineWidth: 2))
                        .padding(.horizontal, 30)

                    HStack {
                        Button(action: {
                            viewModel.register()
                        }) {
                            Text("Registrar")
                                .font(.headline)
                                .padding(5)
                                .foregroundStyle(.pokeBlack)
                                .cornerRadius(10)
                        }
                        .bold()
                        .padding(5)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.pokeWhiteFef)
                        .padding(.horizontal, 30)
                        .cornerRadius(8)
                        .shadow(
                            color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
                    }
                }
                .padding(.top, 40)
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterEmailView()
}

