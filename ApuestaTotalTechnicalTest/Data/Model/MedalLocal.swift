//
//  MedalLocal.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

import SwiftData

@Model
class MedalLocal {
    @Attribute(.unique) var id: String
    var name: String
    var descriptionMedal: String
    var icon: String
    var category: String
    var rarity: String
    var backgroundColor: String
    var progressColor: String
    var level: Int
    var points: Int
    var maxLevel: Int
    var reward: String
    var unlockedAt: String
    var nextLevelGoal: String
    var isLocked: Bool
    var animationType: String

    init(id: String, name: String, descriptionMedal: String, icon: String, category: String, rarity: String, backgroundColor: String, progressColor: String, level: Int, points: Int, maxLevel: Int, reward: String, unlockedAt: String, nextLevelGoal: String, isLocked: Bool, animationType: String) {
        self.id = id
        self.name = name
        self.descriptionMedal = descriptionMedal
        self.icon = icon
        self.category = category
        self.rarity = rarity
        self.backgroundColor = backgroundColor
        self.progressColor = progressColor
        self.level = level
        self.points = points
        self.maxLevel = maxLevel
        self.reward = reward
        self.unlockedAt = unlockedAt
        self.nextLevelGoal = nextLevelGoal
        self.isLocked = isLocked
        self.animationType = animationType
    }
}
