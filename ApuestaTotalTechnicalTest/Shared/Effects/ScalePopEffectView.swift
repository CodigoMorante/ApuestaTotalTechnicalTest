//
//  ScalePopEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct ScalePopEffectView: View {
    @State private var pop = false

    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(Color.pink.opacity(0.5))
                .frame(width: 100, height: 100)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .scaleEffect(pop ? 1.4 : 0.6)
                .opacity(pop ? 0 : 1)
                .animation(
                    .easeOut(duration: 0.4),
                    value: pop
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            pop = true
        }
        .allowsHitTesting(false)
    }
}
