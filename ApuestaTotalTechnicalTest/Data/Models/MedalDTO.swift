//
//  MedalDTO.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

struct MedalDTO: Decodable {
    let id: String
    let name: String
    let description: String
    let icon: String
    let category: String
    let rarity: String
    let backgroundColor: String
    let progressColor: String
    let level: Int
    let points: Int
    let maxLevel: Int
    let reward: String
    let unlockedAt: String
    let nextLevelGoal: String
    let isLocked: Bool
    let animationType: String
}
