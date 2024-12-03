//
//  PerfilView.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 3/12/24.
//

import SwiftUI

struct PerfilView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                List(lista){ item in
                    HStack{
                        emoji(emoji: item)
                        Text(item.nombre)
                            .bold()
                    }
                }
                .scrollContentBackground(.hidden)
                
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
    PerfilView()
}
