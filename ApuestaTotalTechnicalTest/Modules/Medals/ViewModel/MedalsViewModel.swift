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
    
    func loadMedals() async {
        do {
            let result = try await useCase.syncMedalsUseCase.execute()
            updateMedals(result)
        } catch {
            errorMessage = MedalError.syncFailed.message
        }
    }
    
    func startIncrementingMedalPoints() async {
        await stopIncrementingMedalPoints()
        medalTask = Task {
            while !Task.isCancelled {
                do {
                    try await useCase.incrementMedalPointsUseCase.execute(medals: medals)
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    await loadMedals()
                } catch {

                }
            }
        }
    }

    
    private func stopIncrementingMedalPoints() async {
        medalTask?.cancel()
        medalTask = nil
    }
    
    func resetMedalPoints() async {
        do {
            try await useCase.resetMedalUseCase.execute()
        } catch {
            errorMessage = MedalError.resetFailed.message
        }
    }
    
    func handleScenePhaseChange(_ phase: ScenePhase) async {
        switch phase {
        case .active:
            await startIncrementingMedalPoints()
        case .background:
            await stopIncrementingMedalPoints()
        default: break
        }
    }
    
    private func updateMedals(_ newMedals: [Medal]) {
        medals = newMedals
    }
    
}
