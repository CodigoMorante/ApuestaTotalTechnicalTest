//
//  ResetMedalUseCase.swift.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftData

final class ResetMedalUseCase: ResetMedalUseCaseProtocol {
    private let repository: MedalRepository
    
    init(repository: MedalRepository) {
        self.repository = repository
    }
    
    func execute() throws {
        try repository.resetAllMedals()
    }
}
