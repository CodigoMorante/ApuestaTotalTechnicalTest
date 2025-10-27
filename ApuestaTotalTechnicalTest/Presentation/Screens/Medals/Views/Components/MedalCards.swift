//
//  MedalCards.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//

import SwiftUI

struct MedalCards: View {
    @State private var rotation: Double = 0
    @State private var isFlipped = false
    @State private var showEffect = false

    var medal: Medal

    var body: some View {
        ZStack {
            if isFlipped {
                BackCardView(medal: medal)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            } else {
                FrontCardView(medal: medal, showEffect: $showEffect)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
        .background(Color(hex: medal.backgroundColor))
        .cornerRadius(12)
        .shadow(radius: 4)
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .gesture(
            DragGesture()
                .onEnded { value in
                    if abs(value.translation.width) > 50 {
                        rotation += 180
                        isFlipped.toggle()
                    }
                }
        )
        .animation(.easeInOut(duration: 0.4), value: rotation)
    }
}
