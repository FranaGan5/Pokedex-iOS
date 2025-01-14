//
//  ContentView.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import SwiftUI
import PokemonAPI

struct HomeView: View {
    @ObservedObject var autentificacionViewModel: AutentificacionViewModel
    @StateObject private var viewModel = PokemonViewModel()
    @State private var buscarNombre: String = ""
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            Image("FondoPokeball")
                VStack {
                    TextField("Introduce el pokemon a buscar", text: $buscarNombre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(maxWidth: 300)
                        .onChange(of: buscarNombre) { _ in
                            buscarNombre = buscarNombre.lowercased()
                        }
                    
                    Button(action: {
                        viewModel.fetchPokemonDetails(for: buscarNombre)
                    }) {
                        Image("llama-pokemon")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
     
                    if let errorMessage = viewModel.errorMensaje {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    } else {
                        VStack{
                            if let imageUrl = viewModel.pokemonImageUrl, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                } placeholder: {
                                    ProgressView()
                                }
                            } else {
                                Text("No se encontró imagen.")
                                    .foregroundColor(.gray)
                                    .padding()
                            }
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
                        }.padding(.top, 20)
                    }
                }
            }
        }
}

#Preview {
    HomeView(autentificacionViewModel: AutentificacionViewModel())
}
