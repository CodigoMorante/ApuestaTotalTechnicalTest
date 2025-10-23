//
//  GetMedalsUseCaseProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

protocol GetMedalsUseCaseProtocol {
    func execute() async throws -> [Medal]
}
