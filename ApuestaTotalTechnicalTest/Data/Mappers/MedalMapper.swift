//
//  MedalMapper.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

extension MedalDTO {
    func toDomain() -> Medal {
        return Medal(
            id: self.id,
            name: self.name,
            description: self.description,
            icon: self.icon,
            category: self.category,
            rarity: self.rarity,
            backgroundColor: self.backgroundColor,
            progressColor: self.progressColor,
            level: self.level,
            points: self.points,
            maxLevel: self.maxLevel,
            reward: self.reward,
            unlockedAt: self.unlockedAt,
            nextLevelGoal: self.nextLevelGoal,
            isLocked: self.isLocked,
            animationType: self.animationType
        )
    }
}
