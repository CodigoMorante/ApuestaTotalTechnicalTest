//
//  MainTabView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 26/10/25.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @State private var tapCount = 0
    @State private var showAlert = false
    @StateObject var medalsViewModel: MedalsViewModel
    
    var body: some View {
        TabView {
            NavigationStack {
                MedalsModuleBuilder.buildView(viewModel: medalsViewModel)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                tapCount += 1
                                if tapCount == 5 {
                                    showAlert = true
                                    tapCount = 0
                                }
                            }) {
                                Image(systemName: "arrow.counterclockwise")
                            }
                        }
                    }
                    .alert("¿Reiniciar progreso?", isPresented: $showAlert) {
                        Button("Reiniciar", role: .destructive) {
                            medalsViewModel.resetProgressde()
                        }
                        Button("Cancelar", role: .cancel) { }
                    }
            }
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
    }
    
}
