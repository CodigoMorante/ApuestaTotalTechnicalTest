//
//  MedalsView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI

struct MedalsView: View {
    @StateObject var viewModel: MedalsViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                if let error = viewModel.errorMessage {
                    ErrorView(message: error)
                } else {
                    MedalGrid(medals: viewModel.medals)
                        .padding(.bottom, 40)
                }
            }
            .task {
                viewModel.loadMedals()
            }
            .navigationTitle("Medallas")
        }
    }
}
