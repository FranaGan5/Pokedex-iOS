//
//  CerrarView.swift
//  Pokedex
//
//  Created by FranaGan on 16/12/24.
//

import SwiftUI

struct CloseView: View {
    @Environment(\.dismiss) var cerrar
    var body: some View {
        HStack{
            Button("", systemImage: "xmark"){
                cerrar()
            }
            .tint(Color.pokeBlack)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 45)
    }
}

#Preview {
    CloseView()
}
