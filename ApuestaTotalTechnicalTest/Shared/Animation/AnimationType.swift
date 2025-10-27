//
//  AnimationType.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

enum AnimationType {
    case pulse, flash
    
    init?(from string: String) {
        switch string.lowercased() {
        case "pulse": self = .pulse
        case "flash": self = .flash
        default: self = .pulse
        }
    }
}
