//
//  FlashEffectView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct FlashEffectView: View {
    @State private var flash = false

    var body: some View {
        Color.white
            .opacity(flash ? 0.8 : 0.0)
            .animation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true), value: flash)
            .onAppear { flash = true }
            .ignoresSafeArea()
    }
}
