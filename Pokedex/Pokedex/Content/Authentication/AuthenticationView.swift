//
//  LoginView.swift
//  Pokedex
//
//  Created by FranaGan on 11/12/24.
//

import SwiftUI

enum AutehenticationSheetView: String, Identifiable {
    case registro
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    
    @State private var authenticationSheetView: AutehenticationSheetView?
    @State private var gradienteInicio = UnitPoint.topLeading
    @State private var gradienteFin = UnitPoint.bottomTrailing

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.red, .white, .red, .white]),
                startPoint: gradienteInicio,
                endPoint: gradienteFin
            )
            .ignoresSafeArea()
            .animation(Animation.linear(duration: 8).repeatForever(autoreverses: false), value: gradienteInicio)
            
            VStack {
                Image("pokemon-logo")
                    .resizable()
                    .frame(width: 220, height: 80)
                
                VStack {
                    Button {
                        authenticationSheetView = .login
                    } label: {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Text("Accede por Email")
                        }
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                    .foregroundColor(.black)
                    .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
                    .padding(.horizontal, 16)
                }

                .padding(.top, 200)
                
                Spacer()
                
                HStack {
                    Button {
                        authenticationSheetView = .registro
                    } label: {
                        Text("¿No tienes cuenta?")
                        Text("Registrate")
                            .underline()
                    }
                    .tint(.black)
                }
            }
            
            .onAppear {
                inicioGradienteAnimation()
            }
        }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .registro:
                RegisterEmailView()
            case .login:
                SignInEmailView()
            }
        }
    }

    func inicioGradienteAnimation() {
        withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
            gradienteInicio = .bottomTrailing
            gradienteFin = .topLeading
        }
    }
}

#Preview {
    AuthenticationView()
}
