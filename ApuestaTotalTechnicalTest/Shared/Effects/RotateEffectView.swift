//
//  RotateEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct RotateEffectView: View {
    @State private var rotate = false

    var body: some View {
        GeometryReader { geometry in
            ArcShape()
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink]),
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 12, lineCap: .round)
                )
                .frame(width: 120, height: 120)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(
                    .linear(duration: 1.5)
                        .repeatForever(autoreverses: false),
                    value: rotate
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            rotate = true
        }
        .allowsHitTesting(false)
    }
}

// Custom shape for an open arc (incomplete circle)
struct ArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: .degrees(-40),
            endAngle: .degrees(220),
            clockwise: false
        )
        return path
    }
}
