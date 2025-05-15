//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by FranaGan on 15/5/25.
//

import Foundation

@MainActor
final class PokemonDetailViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var height: Int = 0
    @Published var weight: Int = 0
    @Published var abilities: [String] = []
    @Published var stats: [StatViewModel] = []
    @Published var imageURL: URL?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service = PokeApiService()
    
    func fetchDetails(from urlString: String) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let pokemon = try await service.getPokemonDetail(from: urlString)
            
            self.name = pokemon.name.capitalized
            self.height = pokemon.height
            self.weight = pokemon.weight
            self.imageURL = URL(string: pokemon.sprites.front_default)
            self.stats = pokemon.stats.map {
                StatViewModel(name: $0.stat.name.capitalized, value: $0.base_stat)
            }
            
            // PARALLEL FETCH of abilities translations
            var translatedAbilities: [String] = []
            
            // Llamadas async paralelas
            let abilityTranslations = try await withThrowingTaskGroup(of: String.self) { group -> [String] in
                for ability in pokemon.abilities {
                    group.addTask {
                        do {
                            let abilityDetail = try await self.service.getAbilityDetail(for: ability.ability.name)
                            if let translatedName = abilityDetail.names.first(where: { $0.language.name == "es" })?.name {
                                return translatedName.capitalized
                            } else {
                                return ability.ability.name.capitalized // fallback si no hay traducción
                            }
                        } catch {
                            return ability.ability.name.capitalized // fallback si falla
                        }
                    }
                }
                
                var results: [String] = []
                for try await name in group {
                    results.append(name)
                }
                return results
            }
            
            self.abilities = abilityTranslations
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }


}

struct StatViewModel: Identifiable {
    let id = UUID()
    let name: String
    let value: Int
}
