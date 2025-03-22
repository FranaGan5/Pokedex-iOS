//
//  ContentView.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import SwiftUI

struct PokemonView: View {
    
    @StateObject private var viewModelPokemonList = PokemonListViewModel()
    @State private var buscarNombre: String = ""
    
    let listadoPokemon = [
        GridItem(.flexible(minimum: 100, maximum: 100)),
        GridItem(.flexible(minimum: 100, maximum: 100)),
        GridItem(.flexible(minimum: 100, maximum: 100)),
    ]
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Image("FondoPokeball")
            ScrollView {
                VStack{
                    HStack {
                        TextField("Introduce el pokemon a buscar", text: $buscarNombre)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity)
                            .onChange(of: buscarNombre) { _ in
                                buscarNombre = buscarNombre.lowercased()
                            }

                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    .frame(maxWidth: 350)
                    .padding(.vertical, 50)

                    LazyVGrid(columns: listadoPokemon, spacing: 50){
                        ForEach(viewModelPokemonList.pokemons, id: \.name) { pokemon in
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
                                    .foregroundColor(.white)
                            }
                        }
                    }.task {
                        await viewModelPokemonList.fetchPokemons()
                    }
                    
                    Spacer()
                  
                    }
                }
            }
        }
    }

#Preview {
    PokemonView()
}
