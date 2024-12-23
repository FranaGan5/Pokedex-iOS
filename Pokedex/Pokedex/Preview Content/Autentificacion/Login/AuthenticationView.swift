//
//  LoginView.swift
//  Pokedex
//
//  Created by FranaGan on 11/12/24.
//

import SwiftUI


enum AutehenticationSheetView: String, Identifiable{
    case registro
    case login
    
    var id: String{
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
    @State private var authenticationSheetView: AutehenticationSheetView?
    var body: some View {
        ZStack{
            Color(Colors.amarilloPastel.rawValue)
                .ignoresSafeArea(.all)
                .opacity(0.3)
            VStack{
                Spacer()
                Image("pokebola")
                VStack{
                    Button{
                        authenticationSheetView = .login
                    }label: {
                        Label("Accede por Email", systemImage: "envelope.fill")
                        
                    }
                    .tint(.black)
                }
                .controlSize(.large)
                .buttonStyle(.bordered)
                .padding(.top, 40)
                Spacer()
                HStack{
                    Button{
                        authenticationSheetView = .registro
                    }label: {
                        Text("¿No tienes cuenta?")
                        Text("Registrate")
                            .underline()
                    }
                    .tint(.black)
                }
            }
        }
        .sheet(item: $authenticationSheetView){ sheet in
            switch sheet{
            case .registro:
                RegistrarEmailView(autentificacionViewModel: autentificacionViewModel)
            case .login:
                LoginEmailView(autentificacionViewModel: autentificacionViewModel)
            }
        }
    }
}


#Preview {
    AuthenticationView(autentificacionViewModel: AutentificacionViewModel())
}
