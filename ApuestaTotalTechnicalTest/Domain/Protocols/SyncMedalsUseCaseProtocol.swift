//
//  SyncMedalsUseCaseProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

protocol SyncMedalsUseCaseProtocol {
    func execute() async throws -> [Medal]
}
