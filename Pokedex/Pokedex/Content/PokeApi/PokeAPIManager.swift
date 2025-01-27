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
    //Esta llamada se utiliza para obtener pokemon en concreto
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
    //Con esta llamada hacemos una lista de elementos
    func fetchListaPokemon(completion: @escaping (Result<PokemonListResponse, Error>) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=200"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let pokemonListResponse = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                completion(.success(pokemonListResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
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
    struct PokemonListResponse: Decodable {
        struct PokemonResult: Decodable {
            let name: String
            let url: String
        }

        let results: [PokemonResult]
    }
    
}
