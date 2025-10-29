//
//  MedalRepository.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

import SwiftData
import Foundation

final class MedalRepository: MedalRepositoryProtocol {
    
    private let context: ModelContext
    private let service: MedalServiceProtocol
    
    init(service: MedalServiceProtocol = MedalServiceMock(), context: ModelContext) {
        self.service = service
        self.context = context
    }
    
    func getMedals() async throws {
        let dtos = try await service.fetchMedals()
        for dto in dtos {
            let medal = MedalMapper.fromDtoToMedal(dto)
            let local = MedalMapper.fromEntityToLocal(medal)
            context.insert(local)
        }
        try context.save()
    }
    
    func getLocalMedals() async throws -> [Medal] {
        let locals = try context.fetch(FetchDescriptor<MedalLocal>())
        return locals.map { MedalMapper.toEntity($0) }
    }
    
    func medalsToUpdate(_ updated: [Medal]) async throws -> Void {
        for medal in updated {
            let medalId = medal.id
            let descriptor = FetchDescriptor<MedalLocal>(
                predicate: #Predicate { $0.id == medalId }
            )
            guard let local = try context.fetch(descriptor).first else {
                continue
            }
            local.level = medal.level
            local.points = medal.points
            local.nextLevelGoal = medal.nextLevelGoal
            local.isLocked = medal.isLocked
        }
        try context.save()
    }
    
    func resetAllMedals() async throws {
        let medals = try context.fetch(FetchDescriptor<MedalLocal>())
        guard !medals.isEmpty else { return }
        for medal in medals {
            reset(medal)
        }
        try context.save()
    }
    
    private func reset(_ medal: MedalLocal) {
        medal.points = 0
        medal.level = 1
    }
    
}
