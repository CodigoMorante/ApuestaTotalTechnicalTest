//
//  AppEntryView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 31/10/25.
//

import SwiftUI
import SwiftData

struct AppEntryView: View {
    @State private var isReady = false
    @Environment(\.modelContext) private var context
    @ObservedObject var medalsViewModel: MedalsViewModel
        
    var body: some View {
        ZStack {
            if isReady {
                MainTabView(medalsViewModel: medalsViewModel)
                    .transition(.opacity)
            } else {
                SplashScreenView()
                    .transition(.opacity)
            }
        }
        .animation(.easeOut(duration: 0.5), value: isReady)
        .task {
            await medalsViewModel.loadMedals()
            await medalsViewModel.startIncrementingMedalPoints()
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            withAnimation {
                isReady = true
            }
        }
    }
}
