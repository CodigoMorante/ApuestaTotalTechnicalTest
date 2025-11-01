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
                            .opacity(item.isLocked ? 0.5 : 1.0)
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
            .background(Color.green.opacity(0.3))
        }
    }
}
