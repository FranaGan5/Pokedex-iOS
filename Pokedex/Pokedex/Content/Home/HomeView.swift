//
//  ContentView.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import SwiftUI
import PokemonAPI

struct HomeView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
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
                        ForEach(viewModel.pokemonDatos, id: \.name) { pokemon in
                            VStack {
                                if let url = URL(string: pokemon.imageUrl) {
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
                    }.onAppear {
                        viewModel.fetchListaPokemon()
                    }
                    
                    Spacer()
                    
                    /*if let errorMessage = viewModel.errorMensaje {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    } else {
                        VStack{
                            
                            Text("Nombre: \(viewModel.pokemonName)")
                                .padding(10)
                                .foregroundStyle(Color.white)
                            Text("Alto: \(viewModel.pokemonHeight)")
                                .padding(10)
                                .foregroundStyle(Color.white)
                            Text("Ancho: \(viewModel.pokemonWeight)")
                                .padding(10)
                                .foregroundStyle(Color.white)
                            Text("Habilidades: \(viewModel.abilities.joined(separator: ", "))")
                                .padding(10)
                                .foregroundStyle(Color.white)
                     }
                        }.padding(.top, 20)*/
                    }
                }
            }
        }
    }

#Preview {
    HomeView()
}
