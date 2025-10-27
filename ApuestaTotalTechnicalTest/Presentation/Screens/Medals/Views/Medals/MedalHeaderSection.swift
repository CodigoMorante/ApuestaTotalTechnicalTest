//
//  MedalHeaderSection.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct MedalHeaderSection: View {
    let medal: Medal

    var body: some View {
        VStack(spacing: 4) {
            Text("Nivel \(medal.level)")
                .foregroundStyle(Color(hex: medal.progressColor))
                .font(.system(size: 18, weight: .bold))

            Text(medal.name)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
                .shadow(color: Color(hex: medal.progressColor), radius: 15, x: 4, y: 4)
        }
    }
}
