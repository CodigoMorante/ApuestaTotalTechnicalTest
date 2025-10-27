//
//  MedalService.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import Foundation

final class MedalService: MedalServiceProtocol {
    
    func fetchMedals() async throws -> [MedalDTO] {
        guard let url = URL(string: "https://api.example.com/medals") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([MedalDTO].self, from: data)
    }
    
}
