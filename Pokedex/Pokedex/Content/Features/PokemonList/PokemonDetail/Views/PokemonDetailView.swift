//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Created by FranaGan on 15/5/25.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: PokemonListItem
    @StateObject private var viewModel = PokemonDetailViewModel()
    @EnvironmentObject var favoritesManager: FavoritesPokemonManager

    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let url = viewModel.imageURL {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text(viewModel.name)
                    .font(.largeTitle)
                    .bold()
                
                Button {
                    favoritesManager.toggleFavorite(pokemon)
                } label: {
                    Label(
                        favoritesManager.isFavorite(pokemon) ? "Eliminar de favoritos" : "Añadir a favoritos",
                        systemImage: favoritesManager.isFavorite(pokemon) ? "heart.fill" : "heart"
                    )
                    .labelStyle(.titleAndIcon)
                    .foregroundStyle(.pokeBlack)
                }
                .buttonStyle(.borderedProminent)
                .tint(favoritesManager.isFavorite(pokemon) ? .pokeRedF03 : .pokeBlue17C)
                
                
                
                HStack {
                    Text("\(Text("height")): \(viewModel.height)")
                    Text("\(Text("weight")): \(viewModel.weight)")
                }
                .font(.subheadline)
                .foregroundColor(.gray)

                VStack(alignment: .leading, spacing: 10) {
                    Text("abilities")
                        .font(.headline)
                    
                    ForEach(viewModel.abilities, id: \.self) { ability in
                        Text(ability.capitalized)
                    }
                }
                .padding(.top)

                VStack(alignment: .leading, spacing: 10) {
                    Text("stats")
                        .font(.headline)
                    
                    ForEach(viewModel.stats) { stat in
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(LocalizedStringKey(stat.name.lowercased()))
                                    .font(.subheadline)
                                Spacer()
                                Text("\(stat.value)")
                                    .font(.subheadline)
                                    .bold()
                            }
                            
                            ProgressView(value: min(Double(stat.value), 150), total: 150)
                                .progressViewStyle(.linear)
                                .tint(color(for: stat.name))
                                .frame(height: 8)
                                .animation(.easeOut(duration: 0.8), value: stat.value)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.top)


                Spacer()
            }
            .padding()
        }
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchDetails(from: pokemon.url)
        }
    }
}

private extension PokemonDetailView {
    func color(for statName: String) -> Color {
        switch statName.lowercased() {
        case "hp":
            return .red
        case "attack":
            return .orange
        case "defense":
            return .blue
        case "speed":
            return .green
        case "special-attack":
            return .pink
        case "special-defense":
            return .mint
        default:
            return .purple
        }
    }
}



#Preview {
    PokemonDetailView(pokemon: PokemonListItem(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"))
        .environmentObject(FavoritesPokemonManager())
}

