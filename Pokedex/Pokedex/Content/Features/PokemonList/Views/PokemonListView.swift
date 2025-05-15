//
//  PokemonListView.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//



import SwiftUI

struct PokemonView: View {
    
    @StateObject private var viewModelPokemonList = PokemonListViewModel()
    
    let listadoPokemon = [
        GridItem(.flexible(minimum: 100, maximum: 100)),
        GridItem(.flexible(minimum: 100, maximum: 100)),
        GridItem(.flexible(minimum: 100, maximum: 100)),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.pokeWhiteFef.ignoresSafeArea()
                Image("FondoPokeball")
                    .opacity(0.2)
                
                ScrollView {
                    LazyVGrid(columns: listadoPokemon, spacing: 50) {
                        ForEach(viewModelPokemonList.filteredPokemons, id: \.name) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                VStack {
                                    if let url = pokemon.imageURL {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                    Text(pokemon.name)
                                        .font(.headline)
                                        .foregroundColor(.pokeBlack)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Pokédex")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.pokeRedF03, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.light, for: .navigationBar)
            .searchable(text: $viewModelPokemonList.searchText, prompt: "Encuentra tu pokémon favorito")
            .task {
                await viewModelPokemonList.fetchPokemons()
            }
        }
    }
}

#Preview {
    PokemonView()
}
