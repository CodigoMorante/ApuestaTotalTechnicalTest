//
//  IncrementMedalPointsUseCaseProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

protocol IncrementMedalPointsUseCaseProtocol {
    func execute(medals: [Medal]) async throws -> Bool
}
