//
//  MedalsViewModel.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import Combine
import SwiftUI

@MainActor
class MedalsViewModel: ObservableObject {
    
    @Published var medals: [Medal] = []
    @Published var errorMessage: String? = nil
    private var medalTask: Task<Void, Never>?
    private let useCase: MedalUseCaseProtocol
    
    init(useCase: MedalUseCaseProtocol) {
        self.useCase = useCase
    }
    
    deinit {
        medalTask?.cancel()
    }
    
    func loadMedals() {
        Task {
            do {
                medals = try await useCase.syncMedalsUseCase.execute()
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    private func startIncrementingMedalPoints() {
        stopIncrementingMedalPoints()
        medalTask = Task {
            while !Task.isCancelled {
                do {
                    medals = try await useCase.incrementMedalPointsUseCase.execute()
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                } catch {

                }
            }
        }
    }
    
    private func stopIncrementingMedalPoints() {
        medalTask?.cancel()
        medalTask = nil
    }
    
    func resetMedalPoints() {
        do {
            try useCase.resetMedalUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func handleScenePhaseChange(_ phase: ScenePhase) {
        switch phase {
        case .active:
            startIncrementingMedalPoints()
        case .background:
            stopIncrementingMedalPoints()
        default: break
        }
    }
    
}
