//
//  FavoritesPokemonManager.swift
//  Pokedex
//
//  Created by FranaGan on 2/6/25.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

class FavoritesPokemonManager: ObservableObject {
    static let shared = FavoritesPokemonManager()

    @Published private(set) var favorites: [PokemonListItem] = [] {
        didSet {
            saveFavorites()
        }
    }

    private let favoritesKey = "favorites_pokemon_list"

    init() {
        loadFavorites()
    }

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

    private func saveFavorites() {
        guard let data = try? JSONEncoder().encode(favorites) else { return }
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }

    private func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey),
              let decoded = try? JSONDecoder().decode([PokemonListItem].self, from: data) else { return }
        favorites = decoded
    }
}
