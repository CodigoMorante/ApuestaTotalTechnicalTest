//
//  AnimationType.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

enum AnimationType {
    case pulse, flash, sparkle, confetti, shine, explosion, bounce
    
    init?(from string: String) {
        switch string.lowercased() {
        case "pulse": self = .pulse
        case "flash": self = .flash
        case "sparkle": self = .sparkle
        case "confetti": self = .confetti
        case "shine": self = .shine
        case "explosion": self = .explosion
        case "bounce": self = .bounce
        default: self = .pulse
        }
    }
}
