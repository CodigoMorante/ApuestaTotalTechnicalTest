//
//  PulseEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct PulseEffectView: View {
    @State private var pulse = false

    var body: some View {
        Circle()
            .fill(Color.blue.opacity(0.3))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scaleEffect(pulse ? 2.5 : 1.0)
            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: pulse)
            .onAppear { pulse = true }
    }
}
