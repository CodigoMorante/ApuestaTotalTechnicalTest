//
//  MedalsViewModel.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import Combine
import Foundation
import SwiftUI
import SwiftData

@MainActor
class MedalsViewModel: ObservableObject {
    
    @Published var medals: [Medal] = []
    @Published var errorMessage: String? = nil
    private var medalTask: Task<Void, Never>?
    
    private let useCase: MedalUseCaseProtocol
    
    init(useCase: MedalUseCaseProtocol) {
        self.useCase = useCase
        observeAppLifecycle()
    }
    
    private func observeAppLifecycle() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    @objc private func appDidEnterBackground() {
        medalTask?.cancel()
        medalTask = nil
    }

    @objc private func appWillEnterForeground() {
        increaseMedalPoints()
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
    
    func increaseMedalPoints() {
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
    
}
