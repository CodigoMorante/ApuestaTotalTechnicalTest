//
//  MainTabViewContainer.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct MainTabViewContainer: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        let viewModel = MedalsModuleBuilder.buildViewModel(context: context)
        MainTabView(medalsViewModel: viewModel)
    }
}
