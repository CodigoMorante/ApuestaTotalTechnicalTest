//
//  Untitled.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI
import SwiftData

struct MedalsModuleBuilder {
    static func build(context: ModelContext) -> some View {
        let repository = MedalRepository(context: context)
        let syncMedalsUseCase = SyncMedalsUseCase(repository: repository)
        let incrementMedalsUseCase = IncrementMedalPointsUseCase(repository: repository)
        let medalUseCase = MedalUseCase(syncMedalsUseCase: syncMedalsUseCase, incrementMedalPointsUseCase: incrementMedalsUseCase)
        let viewModel = MedalsViewModel(useCase: medalUseCase)
        return MedalsView(viewModel: viewModel)
    }
}
