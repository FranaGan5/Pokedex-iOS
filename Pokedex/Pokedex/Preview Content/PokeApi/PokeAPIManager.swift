//
//  PokeAPIManager.swift
//  Pokedex
//
//  Created by FranaGan 14/1/25.
//

import Foundation
import PokemonAPI

final class PokeAPIManager {
    
    //MARK: Instancia para el Singleton
    static let shared = PokeAPIManager()
    
    //El iniciador init vacio evita nuevas instancias desde fuera
    private init() {}
    
    //MARK: Método de conexión
    func fetchPokemon(named name: String, completion: @escaping(Result<Pokemon, Error>) -> Void){
        let baseURL = "https://pokeapi.co/api/v2/pokemon/"
        guard let url = URL(string: baseURL + name) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                completion(.success(pokemon))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    //MARK: Errores de conexión
    enum NetworkError: Error {
        case invalidURL
        case invalidResponse
        case noData
    }
    
    //MARK: Modelo para obtener los pokemon
    struct Pokemon: Codable {
        let name: String
        let height: Int
        let weight: Int
        let abilities: [Ability]
        let sprites: Sprites?
        
        struct Ability: Codable {
            let ability: Name
        }
        
        struct Name: Codable {
            let name: String
        }
        
        struct Sprites: Codable {
            let frontDefault: String?
            let other: Other?
            
            enum CodingKeys: String, CodingKey {
                case frontDefault = "front_default"
                case other
            }
            
            struct Other: Codable {
                let officialArtwork: OfficialArtwork?
                
                enum CodingKeys: String, CodingKey {
                    case officialArtwork = "official-artwork"
                }
                
                struct OfficialArtwork: Codable {
                    let frontDefault: String?
                    
                    enum CodingKeys: String, CodingKey {
                        case frontDefault = "front_default"
                    }
                }
            }
        }
    }
}
