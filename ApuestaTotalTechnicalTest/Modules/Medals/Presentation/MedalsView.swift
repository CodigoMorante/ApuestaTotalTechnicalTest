//
//  MedalsView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI

struct MedalsView: View {
    @StateObject var viewModel: MedalsViewModel
        
    var body: some View {
            Group {
                if let error = viewModel.errorMessage {
                    ErrorView(message: error)
                } else {
                    MedalGrid(medals: viewModel.medals)
                }
            }
            .task {
                viewModel.loadMedals()
            }
            .background(Color.red)
    }
}
