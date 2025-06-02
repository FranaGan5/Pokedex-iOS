//
//  FavoritesPokemonManager.swift
//  Pokedex
//
//  Created by FranaGan on 2/6/25.
//

import Foundation
import SwiftUI

class FavoritesPokemonManager: ObservableObject {
    static let shared = FavoritesPokemonManager()
    @Published private(set) var favorites: [PokemonListItem] = []
    
    func toggleFavorite(_ pokemon: PokemonListItem) {
        if let index = favorites.firstIndex(where: { $0.name == pokemon.name }) {
            favorites.remove(at: index)
        } else {
            favorites.append(pokemon)
        }
    }

    func isFavorite(_ pokemon: PokemonListItem) -> Bool {
        favorites.contains(where: { $0.name == pokemon.name })
    }
}

