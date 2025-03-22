//
//  NetworkError.swift
//  Pokedex
//
//  Created by FranaGan on 22/3/25.
//

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case noData
    case decodingFailed
}
