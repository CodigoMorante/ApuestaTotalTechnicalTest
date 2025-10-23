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
        VStack {
            if let error = viewModel.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            } else {
                List(viewModel.medals) { medal in
                    VStack(alignment: .leading) {
                        Text(medal.name).bold()
                        Text(medal.description).font(.subheadline)
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadMedals()
        }
    }
}

#Preview {
    MedalsView(viewModel: MedalsViewModel(useCase: GetMedalsUseCase(repository: MedalRepository())))
}
