//
//  MainTabView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 26/10/25.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var medalsViewModel: MedalsViewModel
    
    var body: some View {
        TabView {
            MedalsModuleBuilder.buildView(viewModel: medalsViewModel)
                .tabItem {
                    Label("Medallas", systemImage: "star.fill")
                }
            
            MissionsModuleBuilder.buildView()
                .tabItem {
                    Label("Misiones", systemImage: "flag.fill")
                }
            
            StreaksModuleBuilder.buildView()
                .tabItem {
                    Label("Rachas", systemImage: "flame.fill")
                }
            
            AlbumsModuleBuilder.buildView()
                .tabItem {
                    Label("Álbum", systemImage: "photo.fill.on.rectangle.fill")
                }
        }
    }
    
}
