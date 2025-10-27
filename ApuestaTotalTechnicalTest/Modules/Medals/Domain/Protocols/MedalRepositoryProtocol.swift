//
//  MedalRepositoryProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

protocol MedalRepositoryProtocol {
    
    func getMedals() async throws
    func getLocalMedals() throws -> [Medal]
    func medalsToUpdate(_ updated: [Medal]) throws -> Void
    func resetAllMedals() throws

}
