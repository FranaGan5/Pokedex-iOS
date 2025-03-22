//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by FranaGan on 14/1/25.
//

import Foundation
import PokemonAPI

@MainActor
final class PokemonListViewModel:ObservableObject {
    
    @Published var pokemons: [PokemonListItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service = PokeApiService()
    
    func fetchPokemons() async {
        
        isLoading = true
        
        do{
            let list = try await service.getPokemonList()
            pokemons = list.results
        }catch{
            errorMessage = error.localizedDescription
        }
        isLoading = false
        
    }
    
    

}

