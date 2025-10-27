//
//  FrontCardView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct FrontCardView: View {
    let medal: Medal
    @Binding var showEffect: Bool

    var body: some View {
        VStack(spacing: 8) {
            Text("\(medal.level)")
                .foregroundStyle(Color(hex: medal.progressColor))
                .font(.system(size: 18, weight: .bold))

            Text(medal.name)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
                .shadow(color: Color(hex: medal.progressColor), radius: 15, x: 4, y: 4)

            AsyncImage(url: URL(string: medal.icon)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
            }

            Text(medal.category).foregroundStyle(.blue)
            Text("Points: \(medal.points)").foregroundStyle(.purple)
            Text(medal.rarity).foregroundStyle(.green)
            Text("Max Level: \(medal.maxLevel)").foregroundStyle(.orange)
        }
        .padding()
        .font(.headline)
        .foregroundColor(.white)
        .onChange(of: medal.points) {
            if medal.points == 100 {
                showEffect = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showEffect = false
                    }
                }
            }
        }
        .overlay(
            Group {
                if medal.points == 100 && showEffect {
                    if let type = AnimationType(from: medal.animationType) {
                        animationView(for: type)
                            .transition(.opacity)
                    }
                }
            }
        )
    }

    @ViewBuilder
    private func animationView(for type: AnimationType) -> some View {
        switch type {
        case .pulse: PulseEffectView()
        case .flash: FlashEffectView()
        }
    }
}
