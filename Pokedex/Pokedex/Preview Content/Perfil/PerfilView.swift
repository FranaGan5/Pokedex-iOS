//
//  PerfilView.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 3/12/24.
//

import SwiftUI

struct PerfilView: View {
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    VStack{
                        List(lista){ item in
                            HStack{
                                emoji(emoji: item)
                                Text(item.nombre)
                                    .bold()
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                    VStack{
                        HStack{
                            Button("Cerrar Sesión"){
                                autentificacionViewModel.logOut()
                            }
                            .padding(.bottom, 30)
                            .foregroundColor(.red)
                                Image("boton-cerrar")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(.bottom, 30)
                                    .foregroundColor(.red)
                        }
                    }
                }
               
            }
            
        }
      
       
    }
   
}
struct emoji: View{
    let emoji: ModeloPerfil
    var body: some View{
        ZStack{
            Text(emoji.emoji)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 3)
                )
        }
    }
}
#Preview {
    PerfilView(autentificacionViewModel: AutentificacionViewModel())
}
