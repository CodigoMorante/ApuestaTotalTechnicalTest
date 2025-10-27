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
}
