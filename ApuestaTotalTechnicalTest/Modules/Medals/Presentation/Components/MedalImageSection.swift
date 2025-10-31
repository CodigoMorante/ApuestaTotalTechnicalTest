//
//  MedalImageSection.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct MedalImageSection: View {
    let iconURL: String

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: iconURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
            }
        }
        .frame(height: 80)
    }
}
