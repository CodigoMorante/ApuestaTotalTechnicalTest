//
//  MedalUseCaseProtocol.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

protocol MedalUseCaseProtocol {
    var syncMedalsUseCase: SyncMedalsUseCaseProtocol { get }
    var incrementMedalPointsUseCase: IncrementMedalPointsUseCaseProtocol { get }
    var resetMedalUseCase: ResetMedalUseCaseProtocol { get }
}
