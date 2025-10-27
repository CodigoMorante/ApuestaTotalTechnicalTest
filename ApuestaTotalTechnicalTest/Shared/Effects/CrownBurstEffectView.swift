//
//  CrownBurstEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct CrownBurstEffectView: View {
    @State private var animate = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<12) { index in
                    Rectangle()
                        .fill(Color.yellow.opacity(0.8))
                        .frame(width: 6, height: geometry.size.height / 2.5) // más largo
                        .cornerRadius(3)
                        .rotationEffect(.degrees(Double(index) * 30))
                        .scaleEffect(animate ? 1.2 : 0.5)
                        .opacity(animate ? 0 : 1)
                        .animation(
                            .easeOut(duration: 0.6)
                            .delay(Double(index) * 0.03),
                            value: animate
                        )
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            animate = true
        }
        .allowsHitTesting(false)
    }
}
