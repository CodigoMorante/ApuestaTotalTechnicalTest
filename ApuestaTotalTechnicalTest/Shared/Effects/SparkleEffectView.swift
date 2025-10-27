//
//  SparkleEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct SparkleEffectView: View {
    @State private var sparkles: [Sparkle] = []
    @State private var animate = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(sparkles) { sparkle in
                    Circle()
                        .fill(sparkle.color)
                        .frame(width: sparkle.size, height: sparkle.size)
                        .position(sparkle.position)
                        .opacity(animate ? 0 : 1)
                        .scaleEffect(animate ? 1.5 : 1)
                        .animation(.easeOut(duration: 2.0), value: animate)
                }
            }
            .onAppear {
                generateSparkles(in: geo.size)
                DispatchQueue.main.async {
                    animate = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    sparkles.removeAll()
                }
            }
        }
        .allowsHitTesting(false)
        .ignoresSafeArea()
    }

    private func generateSparkles(in size: CGSize) {
        sparkles = (0..<40).map { _ in
            Sparkle.random(in: size)
        }
    }
}

struct Sparkle: Identifiable {
    let id = UUID()
    let position: CGPoint
    let color: Color
    let size: CGFloat

    static func random(in size: CGSize) -> Sparkle {
        Sparkle(
            position: CGPoint(
                x: CGFloat.random(in: 0...size.width),
                y: CGFloat.random(in: 0...size.height)
            ),
            color: Color(hue: .random(in: 0...1), saturation: 1, brightness: 1),
            size: CGFloat.random(in: 2...6)
        )
    }
}
