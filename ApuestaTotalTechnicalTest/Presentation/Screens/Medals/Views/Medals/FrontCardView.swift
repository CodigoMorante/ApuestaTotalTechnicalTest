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
        ZStack {
            cardContent
                .modifier(CardStyle())
                .onChange(of: medal.points) { _, newValue in
                    triggerEffectIfNeeded(for: newValue)
                }

            if shouldShowEffect {
                MedalEffectOverlay(typeString: medal.animationType)
                    .transition(.opacity)
            }
        }
    }

    private var cardContent: some View {
        VStack(spacing: 12) {
            MedalHeaderSection(medal: medal)
            MedalImageSection(iconURL: medal.icon)
            MedalInfoSection(medal: medal)
        }
    }

    private var shouldShowEffect: Bool {
        medal.points == 100 && showEffect
    }

    private func triggerEffectIfNeeded(for points: Int) {
        guard points == 100 else { return }
        showEffect = true
        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            withAnimation {
                showEffect = false
            }
        }
    }
}
