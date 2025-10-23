//
//  Untitled.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI

struct MedalsModuleBuilder {
    static func build() -> some View {
        let repository = MedalRepository()
        let useCase = GetMedalsUseCase(repository: repository)
        let viewModel = MedalsViewModel(useCase: useCase)
        return MedalsView(viewModel: viewModel)
    }
}
