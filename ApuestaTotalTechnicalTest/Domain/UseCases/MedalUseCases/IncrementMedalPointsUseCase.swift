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
    
    func execute() async throws -> [Medal] {
        
        let medals = try repository.getLocalMedals()
        var allReached = checkTheMaximumLevelReached(medals: medals)

        if !allReached {
                for medal in medals {
                    let randomIncrement = Int.random(in: 8...10)

                    if medal.isLocked {
                        
                    } else {
                        if  medal.level == medal.maxLevel {
//                            Mensaje de nivel màximo PLUS
                            medal.nextLevelGoal = "Alcanzaste el nivel máximo!"
                        } else {
                            if medal.points == 100 {
                                medal.level += 1
                                medal.points = 0
                            } else {
                                medal.points += randomIncrement
                                if medal.points > 100 {
                                    medal.points = 100
                                }
                            }
            
                            let nextLevelGoal = 100 - medal.points
                            medal.nextLevelGoal = "Suma \(nextLevelGoal) puntos más para alcanzar el siguiente nivel."
                        }
                    }
                }
        }
        try repository.updateLocalMedals(medals)
        allReached = checkTheMaximumLevelReached(medals: medals)
        return try repository.getLocalMedals()
    }
    
    private func checkTheMaximumLevelReached(medals: [Medal]) -> Bool {
        var maximumLevelsReached: [Bool] = []
        
        for medal in medals {
            let newElement = medal.maxLevel == medal.level
            maximumLevelsReached.append(newElement)
        }
        
        return maximumLevelsReached.allSatisfy { $0 }
    }

}
