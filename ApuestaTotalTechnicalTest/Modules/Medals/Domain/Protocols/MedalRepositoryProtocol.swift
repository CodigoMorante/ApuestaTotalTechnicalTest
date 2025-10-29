//
//  MedalRepositoryProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

protocol MedalRepositoryProtocol {
    
    func getMedals() async throws
    func getLocalMedals() async throws -> [Medal]
    func medalsToUpdate(_ updated: [Medal]) async throws -> Void
    func resetAllMedals() async throws

}
