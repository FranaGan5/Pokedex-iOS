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
    
    func fetchPokemonDetails(for name: String){
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
}
