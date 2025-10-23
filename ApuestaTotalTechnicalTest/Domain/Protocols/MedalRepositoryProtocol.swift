//
//  MedalRepositoryProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

protocol MedalRepositoryProtocol {
    func getMedals() async throws -> [Medal]
}
