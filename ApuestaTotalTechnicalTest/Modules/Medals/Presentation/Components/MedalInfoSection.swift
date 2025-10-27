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

            Text("Puntos: \(medal.points)")
                .foregroundStyle(.purple)

            Text("Rareza: \(medal.rarity)")
                .foregroundStyle(.green)

            Text("Nivel Máximo: \(medal.maxLevel)")
                .foregroundStyle(.orange)
        }
    }
}
