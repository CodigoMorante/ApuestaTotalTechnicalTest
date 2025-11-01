//
//  MedalInfoSection.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct MedalInfoSection: View {
    let medal: Medal

    var body: some View {
        VStack(spacing: 4) {
            Text(medal.category)
                .foregroundStyle(.blue)
                .multilineTextAlignment(.center)

            Text("Puntos: \(medal.points)")
                .foregroundStyle(.purple)
                .multilineTextAlignment(.center)

            Text(medal.rarity)
                .foregroundStyle(.green)
                .multilineTextAlignment(.center)

            Text("Nivel Máximo: \(medal.maxLevel)")
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
        }
    }
}
