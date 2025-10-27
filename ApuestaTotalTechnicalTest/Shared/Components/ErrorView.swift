//
//  ErrorView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 27/10/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    var body: some View {
        Text("Error: \(message)")
            .foregroundColor(.red)
            .padding()
    }
}
