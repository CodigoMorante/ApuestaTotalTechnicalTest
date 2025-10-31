//
//  MedalMapper.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 23/10/25.
//

struct MedalMapper {
    
    static func fromDtoToMedal(_ dto: MedalDTO) -> Medal {
        Medal(id: dto.id, name: dto.name, description: dto.description,
              icon: dto.icon, category: dto.category, rarity: dto.rarity,
              backgroundColor: dto.backgroundColor, progressColor: dto.progressColor, level: dto.level,
              points: dto.points, maxLevel: dto.maxLevel, reward: dto.reward,
              unlockedAt: dto.unlockedAt, nextLevelGoal: dto.nextLevelGoal, isLocked: dto.isLocked,
              animationType: dto.animationType)
       }

    static func toEntity(_ local: MedalLocal) -> Medal {
            Medal(id: local.id, name: local.name, description: local.descriptionMedal,
                  icon: local.icon, category: local.category, rarity: local.rarity,
                  backgroundColor: local.backgroundColor, progressColor: local.progressColor,level: local.level,
                  points: local.points, maxLevel: local.maxLevel, reward: local.reward,
                  unlockedAt: local.unlockedAt, nextLevelGoal: local.nextLevelGoal, isLocked: local.isLocked,
                  animationType: local.animationType)
       }

    static func fromEntityToLocal(_ entity: Medal) -> MedalLocal {
        MedalLocal(id: entity.id, name: entity.name, descriptionMedal: entity.description,
                   icon: entity.icon, category: entity.category, rarity: entity.rarity,
                   backgroundColor: entity.backgroundColor, progressColor: entity.progressColor, level: entity.level,
                   points: entity.points, maxLevel: entity.maxLevel, reward: entity.reward,
                   unlockedAt: entity.unlockedAt, nextLevelGoal: entity.nextLevelGoal, isLocked: entity.isLocked,
                   animationType: entity.animationType)
       }

}
