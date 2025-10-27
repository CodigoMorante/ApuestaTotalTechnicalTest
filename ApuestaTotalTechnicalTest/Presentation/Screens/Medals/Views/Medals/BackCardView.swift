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
            Text(medal.reward).foregroundStyle(.red)
            Text(medal.nextLevelGoal).foregroundStyle(.gray)
            Text(medal.description).foregroundStyle(.yellow)
        }
        .padding()
        .font(.headline)
        .foregroundColor(.white)
    }
}
