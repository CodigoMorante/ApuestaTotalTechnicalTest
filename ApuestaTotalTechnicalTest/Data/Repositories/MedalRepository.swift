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

    func getMedals() async throws -> Void {
        let dtos = try await service.fetchMedals()
        for dto in dtos {
            let medal = MedalMapper.fromDtoToMedal(dto)
            try await storeMedalsLocally(medal: medal)
        }
    }
    
    private func storeMedalsLocally(medal: Medal) async throws -> Void {
        let local = MedalMapper.fromEntityToLocal(medal)
            context.insert(local)
        try context.save()
    }
    
    func getLocalMedals() throws -> [Medal] {
        let locals = try context.fetch(FetchDescriptor<MedalLocal>())
        return locals.map { MedalMapper.toEntity($0) }
    }

    func updateLocalMedals(_ updated: [Medal]) throws -> Void {
        for medal in updated {
            let medalId = medal.id
            let descriptor = FetchDescriptor<MedalLocal>(
                predicate: #Predicate { $0.id == medalId }
            )
            if let local = try context.fetch(descriptor).first {
                local.level = medal.level
                local.points = medal.points
                local.nextLevelGoal = medal.nextLevelGoal
                local.isLocked = medal.isLocked
            }
        }
        try context.save()
    }
    
    func resetAllMedals() throws {
        let medals = try context.fetch(FetchDescriptor<MedalLocal>())
        for medal in medals {
            medal.points = 0
            medal.level = 1
        }
        try context.save()
    }

}
