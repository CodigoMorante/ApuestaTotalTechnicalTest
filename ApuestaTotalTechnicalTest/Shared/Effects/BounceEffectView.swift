//
//  BounceEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct BounceEffectView: View {
    @State private var bounce = false

    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(Color.green.opacity(0.4))
                .frame(width: 80, height: 80)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .offset(y: bounce ? -20 : 0)
                .scaleEffect(bounce ? 1.1 : 1.0)
                .animation(
                    .interpolatingSpring(stiffness: 150, damping: 5)
                        .repeatForever(autoreverses: true),
                    value: bounce
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            bounce = true
        }
        .allowsHitTesting(false)
    }
}
