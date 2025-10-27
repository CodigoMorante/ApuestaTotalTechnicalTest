//
//  ConfettiEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI
import ConfettiSwiftUI

struct ConfettiEffectView: View {
    @State private var trigger = 0

    var body: some View {
        ZStack {
            Color.clear
                .confettiCannon(
                    trigger: $trigger,
                    num: 60,
                    confettis: [.text("🎉"), .text("🏅")],
                    colors: [.red, .blue, .green, .yellow],
                    repetitions: 1,
                    repetitionInterval: 0.6
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            trigger += 1
        }
    }}
