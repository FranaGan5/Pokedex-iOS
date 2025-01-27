//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by FranaGan on 14/1/25.
//

import Foundation
import PokemonAPI

class PokemonViewModel:ObservableObject {
    @Published var pokemonName: String = ""
    @Published var pokemonHeight: Int = 0
    @Published var pokemonWeight: Int = 0
    @Published var abilities: [String] = []
    @Published var pokemonImageUrl: String?
    @Published var errorMensaje: String? = nil
    @Published var imagenesPokemonUrl: [String] = []
    @Published var pokemonDatos: [(name: String, imageUrl: String)] = []

    
    func fetchDetallesPokemon(for name: String){
        PokeAPIManager.shared.fetchPokemon(named: name){ [weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let pokemon):
                    self?.pokemonName = pokemon.name
                    self?.pokemonHeight = pokemon.height
                    self?.pokemonWeight = pokemon.weight
                    self?.abilities = pokemon.abilities.map{ $0.ability.name}
                    self?.pokemonImageUrl = pokemon.sprites?.frontDefault ?? pokemon.sprites?.other?.officialArtwork?.frontDefault
                case .failure(let error):
                    self?.errorMensaje = error.localizedDescription
                }
            }
            
        }
    }

    func fetchListaPokemon() {
        PokeAPIManager.shared.fetchListaPokemon { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemonList):
                    self?.pokemonDatos = pokemonList.results.map { result in
                        let pokemonID = result.url.split(separator: "/").last ?? ""
                        let imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
                        return (name: result.name.capitalized, imageUrl: imageUrl)
                    }
                case .failure(let error):
                    self?.errorMensaje = error.localizedDescription
                }
            }
        }
    }

}

