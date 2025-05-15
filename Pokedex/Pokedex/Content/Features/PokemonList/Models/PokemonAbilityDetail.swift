//
//  PokemonAbilityDetail.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 15/5/25.
//

import Foundation

struct PokemonAbilityDetail: Codable {
    let names: [AbilityName]

    struct AbilityName: Codable {
        let language: Language
        let name: String

        struct Language: Codable {
            let name: String
        }
    }
}
