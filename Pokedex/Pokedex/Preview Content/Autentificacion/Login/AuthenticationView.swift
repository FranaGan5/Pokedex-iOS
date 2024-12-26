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
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
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
                        Label("Accede por Email", systemImage: "envelope.fill")
                    }
                    .tint(.black)
                }
                .controlSize(.large)
                .buttonStyle(.bordered)
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
                startGradienteAnimation()
            }
        }
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .registro:
                RegistrarEmailView(autentificacionViewModel: autentificacionViewModel)
            case .login:
                LoginEmailView(autentificacionViewModel: autentificacionViewModel)
            }
        }
    }

    func startGradienteAnimation() {
        withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
            gradienteInicio = .bottomTrailing
            gradienteFin = .topLeading
        }
    }
}

#Preview {
    AuthenticationView(autentificacionViewModel: AutentificacionViewModel())
}
