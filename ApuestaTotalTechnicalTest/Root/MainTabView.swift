//
//  MainTabView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 26/10/25.
//

import SwiftUI

struct MainTabView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var medalsViewModel: MedalsViewModel
    
    var body: some View {
        TabView {
            MedalsModuleBuilder.buildView(viewModel: medalsViewModel)
                .tabItem {
                    Label("Medallas", systemImage: "star.fill")
                }
            
            NavigationStack {
                Text("Misiones")
            }
            .tabItem {
                Label("Misiones", systemImage: "flag.fill")
            }
            
            NavigationStack {
                Text("Streaks")
            }
            .tabItem {
                Label("Rachas", systemImage: "flame.fill")
            }
            
            NavigationStack {
                Text("Álbum")
            }
            .tabItem {
                Label("Álbum", systemImage: "photo.fill.on.rectangle.fill")
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            medalsViewModel.handleScenePhaseChange(newPhase)
        }
    }
    
}
