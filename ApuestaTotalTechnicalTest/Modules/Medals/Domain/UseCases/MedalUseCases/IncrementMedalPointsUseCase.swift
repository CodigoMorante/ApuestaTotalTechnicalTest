//
//  IncrementMedalPointsUseCase.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

struct IncrementMedalPointsUseCase: IncrementMedalPointsUseCaseProtocol {
    private let repository: MedalRepositoryProtocol
    
    init(repository: MedalRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(medals: [Medal]) async throws -> Bool {
        guard !allMedalsAtMaxLevel(medals) else {
            return true
        }

        for medal in medals {
            guard !medal.isLocked else { continue }
            let increment = Int.random(in: 8...10)
            applyProgress(to: medal, increment: increment)
        }

        try await repository.medalsToUpdate(medals)
        return false
    }

    private func applyProgress(to medal: Medal, increment: Int) {
        if medal.level == medal.maxLevel {
            medal.nextLevelGoal = "Alcanzaste el nivel máximo!"
            return
        }

        if medal.points == 100 {
            medal.level += 1
            medal.points = 0
        } else {
            medal.points += increment
            if medal.points > 100 {
                medal.points = 100
            }
        }

        let nextLevelGoal = 100 - medal.points
        medal.nextLevelGoal = "Suma \(nextLevelGoal) puntos más para alcanzar el siguiente nivel."
    }

    private func allMedalsAtMaxLevel(_ medals: [Medal]) -> Bool {
        medals.allSatisfy { $0.level == $0.maxLevel }
    }
}
