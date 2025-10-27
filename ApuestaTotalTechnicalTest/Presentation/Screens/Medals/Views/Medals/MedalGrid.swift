//
//  MedalGrid.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct MedalGrid: View {
    let medals: [Medal]
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(medals, id: \.id) { item in
                    MedalCards(medal: item)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            .background(Color.green.opacity(0.3))
        }
    }
}
