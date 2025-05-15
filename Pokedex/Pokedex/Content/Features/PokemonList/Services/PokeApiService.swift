//
//  Untitled.swift
//  Pokedex
//
//  Created by FranaGan on 22/3/25.
//

import Foundation

final class PokeApiService{
    
    private let network: NetworkManager
    
    init(network: NetworkManager = .shared){
        self.network = network
    }
    
    func getPokemonList(limit: Int = 500) async throws -> PokemonList {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)") else{
            throw NetworkError.invalidURL
        }
        return try await network.request(url: url)
    }
    func getPokemonDetail(from urlString: String) async throws -> PokemonItem {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        return try await network.request(url: url)
    }
    func getAbilityDetail(for abilityName: String) async throws -> PokemonAbilityDetail {
        guard let url = URL(string: "https://pokeapi.co/api/v2/ability/\(abilityName.lowercased())/") else {
            throw NetworkError.invalidURL
        }
        return try await network.request(url: url)
    }


}
