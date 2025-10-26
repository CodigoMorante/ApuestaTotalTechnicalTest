//
//  MedalsEntryView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 26/10/25.
//

import SwiftUI

struct MedalsEntryView: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        MedalsModuleBuilder.build(context: context)
    }
}
