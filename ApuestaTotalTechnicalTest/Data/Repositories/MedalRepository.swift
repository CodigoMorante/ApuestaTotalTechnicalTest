//
//  MedalRepository.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

final class MedalRepository: MedalRepositoryProtocol {
    
    private let service: MedalServiceProtocol

    init(service: MedalServiceProtocol = MedalServiceMock()) {
        self.service = service
    }

    func getMedals() async throws -> [Medal] {
        let dtos = try await service.fetchMedals()
        return dtos.map { $0.toDomain() }
    }
    
}
