//
//  ResetMedalUseCase.swift.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

final class ResetMedalUseCase: ResetMedalUseCaseProtocol {
    private let repository: MedalRepositoryProtocol
    
    init(repository: MedalRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws {
        try await repository.resetAllMedals()
    }
}
