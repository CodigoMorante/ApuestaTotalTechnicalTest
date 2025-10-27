//
//  MedalEffectOverlay.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct MedalEffectOverlay: View {
    let typeString: String

    var body: some View {
        if let type = AnimationType(from: typeString) {
            animationView(for: type)
        }
    }

    @ViewBuilder
    private func animationView(for type: AnimationType) -> some View {
        switch type {
        case .pulse: PulseEffectView()
        case .flash: FlashEffectView()
        case .sparkle: SparkleEffectView()
        }
    }
}
