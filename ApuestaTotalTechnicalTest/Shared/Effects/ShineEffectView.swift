//
//  ShineEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct ShineEffectView: View {
    @State private var animate = false

    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.6), Color.clear]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: geometry.size.width * 1.5, height: geometry.size.height * 1.5)
                    .rotationEffect(.degrees(30))
                    .offset(x: animate ? geometry.size.width * 1.5 : -geometry.size.width * 1.5)
                    .blendMode(.screen)
                )
                .onAppear {
                    withAnimation(
                        .linear(duration: 1.2)
                        .repeatForever(autoreverses: false)
                    ) {
                        animate = true
                    }
                }
        }
        .allowsHitTesting(false)
    }
}
