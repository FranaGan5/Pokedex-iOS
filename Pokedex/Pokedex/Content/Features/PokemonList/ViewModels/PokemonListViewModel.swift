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
    @Published var searchText: String = ""
    
    private let service = PokeApiService()
    
    var filteredPokemons: [PokemonListItem] {
           guard !searchText.isEmpty else { return pokemons }
           return pokemons.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
       }
    
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

