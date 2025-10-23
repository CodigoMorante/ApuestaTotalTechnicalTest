//
//  GetMedalsUseCase.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

class GetMedalsUseCase: GetMedalsUseCaseProtocol {
    
    private let repository: MedalRepositoryProtocol
    
    init(repository: MedalRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Medal] {
        try await repository.getMedals()
    }
    
}
