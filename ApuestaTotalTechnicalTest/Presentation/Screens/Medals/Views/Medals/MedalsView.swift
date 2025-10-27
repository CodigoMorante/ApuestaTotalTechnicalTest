//
//  MedalsView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftUI
import SwiftData

struct MedalsView: View {
    @StateObject var viewModel: MedalsViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if let error = viewModel.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.medals, id: \.id) { item in
                            MedalCards(medal: item)
                        }
                        .padding()
                    }
                }
                .background(Color.green.opacity(0.3))
                .onAppear {
                    Task {
                        viewModel.loadMedals()
                        viewModel.increaseMedalPoints()
                    }
                }
            }
        }
    }
}

//#Preview {
//    let context = ModelContainer.previewWithData.mainContext
//    MedalsView(viewModel: MedalsViewModel(useCase: GetMedalsUseCase(repository: MedalRepository(context: context))))
//}
