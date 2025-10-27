//
//  SyncMedalsUseCase.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

struct SyncMedalsUseCase: SyncMedalsUseCaseProtocol {
    
    private let repository: MedalRepositoryProtocol

    init(repository: MedalRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Medal] {
        var localMedals = try repository.getLocalMedals()
        
        guard localMedals.isEmpty else {
            return localMedals 
        }
        
        try await repository.getMedals()
        localMedals = try repository.getLocalMedals()
        return localMedals
    }
    
}
