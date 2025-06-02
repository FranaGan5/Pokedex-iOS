//
//  NotificacionesView.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import SwiftUI

import SwiftUI

struct FavoritesPokemonView: View {
    @EnvironmentObject var manager: FavoritesPokemonManager

    var body: some View {
        NavigationStack {
            List {
                ForEach(manager.favorites, id: \.name) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        HStack {
                            if let url = pokemon.imageURL {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            Text(pokemon.name.capitalized)
                                .font(.headline)
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            manager.toggleFavorite(pokemon)
                        } label: {
                            Label("Eliminar", systemImage: "heart.slash.fill")
                        }
                    }
                }
            }
            .navigationTitle("Favoritos")
        }
    }
}

#Preview {
    FavoritesPokemonView()
        .environmentObject(FavoritesPokemonManager())
}


