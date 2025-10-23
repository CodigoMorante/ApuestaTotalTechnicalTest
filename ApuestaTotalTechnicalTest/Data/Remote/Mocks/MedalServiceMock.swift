//
//  MedalServiceMock.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

final class MedalServiceMock: MedalServiceProtocol {
    
    func fetchMedals() async throws -> [MedalDTO] {
        return MockLoader.load("MedalsMock")
    }
    
}
