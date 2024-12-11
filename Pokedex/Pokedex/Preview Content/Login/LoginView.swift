//
//  LoginView.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 11/12/24.
//

import SwiftUI




struct LoginView: View {
    var body: some View {
        ZStack{
            Color.yellow
                .ignoresSafeArea(.all)
            VStack{
                Spacer()
                Image("pokebola")
                VStack{
                    Button{
                        print("login")
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
                        print("registro")
                    }label: {
                        Text("¿No tienes cuenta?")
                        Text("Registrate")
                            .underline()
                    }
                    .tint(.black)
                }
            }
            
            
          
            
          
        }
    }
}


#Preview {
    LoginView()
}
