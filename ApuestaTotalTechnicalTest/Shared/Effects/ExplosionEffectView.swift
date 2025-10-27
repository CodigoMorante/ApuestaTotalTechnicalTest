//
//  ExplosionEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct ExplosionEffectView: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            ForEach(0..<12) { index in
                Circle()
                    .fill(Color.orange.opacity(0.8))
                    .frame(width: 10, height: 10)
                    .offset(x: animate ? explosionOffset(for: index).width : 0,
                            y: animate ? explosionOffset(for: index).height : 0)
                    .scaleEffect(animate ? 1.5 : 0.5)
                    .opacity(animate ? 0 : 1)
                    .animation(
                        .easeOut(duration: 0.6)
                        .delay(Double(index) * 0.03),
                        value: animate
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            animate = true
        }
        .allowsHitTesting(false)
    }

    private func explosionOffset(for index: Int) -> CGSize {
        let angle = Double(index) / 12.0 * 2 * .pi
        let radius: CGFloat = 100
        return CGSize(width: CGFloat(cos(angle)) * radius,
                      height: CGFloat(sin(angle)) * radius)
    }
}
