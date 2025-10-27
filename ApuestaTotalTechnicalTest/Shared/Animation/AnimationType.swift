//
//  AnimationType.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

enum AnimationType: String {
    case pulse, flash, sparkle, confetti, shine, explosion, bounce, crownBurst
    
    init?(from raw: String) {
        self.init(rawValue: raw)
    }
}
