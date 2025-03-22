//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by FranaGan on 22/3/25.
//

import Foundation

struct PokemonItem: Codable {
    let name: String
    let height: String
    let weight: String
    let abilities: [Ability]
    let sprites: Sprites
    
    struct Ability: Codable {
        let ability: Name
    }
    
    struct Name: Codable {
        let name: String
    }
    
    struct Sprites: Codable {
        let front_default: String
        
        enum CodingKeys: String, CodingKey {
            case front_default = "front_default"
         
        }
    }
}

struct PokemonList: Decodable {
    let results: [PokemonListItem]
}

struct PokemonListItem: Identifiable, Decodable {
    let name: String
    let url: String

    var id: String { name }

    var imageURL: URL? {
        guard let id = url.split(separator: "/").compactMap({ Int($0) }).last else {
            return nil
        }
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
}


