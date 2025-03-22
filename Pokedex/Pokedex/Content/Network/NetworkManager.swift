//
//  NetworkManager.swift
//  Pokedex
//
//  Created by FranaGan on 22/3/25.
//

import Foundation


final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}

    func request<T: Decodable>(
        url: URL,
        method: String = "GET",
        headers: [String: String]? = nil
    ) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
