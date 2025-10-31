//
//  BackCardView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct BackCardView: View {
    let medal: Medal

    var body: some View {
        VStack(spacing: 8) {
            Text(medal.reward)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
            Text(medal.nextLevelGoal)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
            Text(medal.description)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
        }
        .padding()
        .font(.headline)
        .foregroundColor(.white)
    }
}
