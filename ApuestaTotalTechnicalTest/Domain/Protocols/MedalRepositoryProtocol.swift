//
//  MedalRepositoryProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

protocol MedalRepositoryProtocol {
    
    func getMedals() async throws -> Void
    func getLocalMedals() throws -> [Medal]
    func updateLocalMedals(_ updated: [Medal]) throws -> Void
    func resetAllMedals() throws

}
