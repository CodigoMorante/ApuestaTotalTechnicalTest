//
//  Untitled.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI
import SwiftData

struct MedalsModuleBuilder {
    static func buildViewModel(context: ModelContext) -> some MedalsViewModel {
        let repository = MedalRepository(context: context)
        let syncMedalsUseCase = SyncMedalsUseCase(repository: repository)
        let incrementMedalsUseCase = IncrementMedalPointsUseCase(repository: repository)
        let resetMedalUseCase = ResetMedalUseCase(repository: repository)
        let medalUseCase = MedalUseCase(syncMedalsUseCase: syncMedalsUseCase, incrementMedalPointsUseCase: incrementMedalsUseCase, resetMedalUseCase: resetMedalUseCase)
        return MedalsViewModel(useCase: medalUseCase)
    }
    
    static func buildView(viewModel: MedalsViewModel) -> some View {
        MedalsView(viewModel: viewModel)
    }
}
