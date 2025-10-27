//
//  MedalsView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI

struct MedalsView: View {
    @StateObject var viewModel: MedalsViewModel
    @State private var tapCount = 0
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            Group {
                if let error = viewModel.errorMessage {
                    ErrorView(message: error)
                } else {
                    MedalGrid(medals: viewModel.medals)
                }
            }
            .navigationTitle("Medallas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        tapCount += 1
                        if tapCount == 5 {
                            showAlert = true
                            tapCount = 0
                        }
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                    }
                }
            }
            .alert("¿Reiniciar progreso?", isPresented: $showAlert) {
                Button("Reiniciar", role: .destructive) {
                    viewModel.resetMedalPoints()
                }
                Button("Cancelar", role: .cancel) { }
            }
            .task {
                viewModel.loadMedals()
            }
        }
    }
}
