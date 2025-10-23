//
//  MedalsViewModel.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import Combine
import Foundation

@MainActor
class MedalsViewModel: ObservableObject {
    @Published var medals: [Medal] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let useCase: GetMedalsUseCase
    
    init(useCase: GetMedalsUseCase) {
        self.useCase = useCase
    }
    
    func loadMedals() {
        isLoading = true
        Task {
            do {
                let result = try await useCase.execute()
                medals = result
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
