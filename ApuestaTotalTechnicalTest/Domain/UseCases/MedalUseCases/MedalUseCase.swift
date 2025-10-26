//
//  MedalUseCase.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

struct MedalUseCase: MedalUseCaseProtocol {
    var syncMedalsUseCase: SyncMedalsUseCaseProtocol
    var incrementMedalPointsUseCase: IncrementMedalPointsUseCaseProtocol
}
