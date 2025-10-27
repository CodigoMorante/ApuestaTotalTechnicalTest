//
//  EffectOverlay.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct EffectOverlay: View {
    let typeString: String

    var body: some View {
        if let type = AnimationType(from: typeString) {
            animationView(for: type)
                .onAppear(){
                    print(type)
                }
        }
    }

    @ViewBuilder
    private func animationView(for type: AnimationType) -> some View {
        switch type {
        case .pulse: PulseEffectView()
        case .flash: FlashEffectView()
        case .sparkle: SparkleEffectView()
        case .confetti: ConfettiEffectView()
        case .shine: ShineEffectView()
        case .explosion: ExplosionEffectView()
        case .bounce: BounceEffectView()
        case .crownBurst: CrownBurstEffectView()
        }
    }
}
