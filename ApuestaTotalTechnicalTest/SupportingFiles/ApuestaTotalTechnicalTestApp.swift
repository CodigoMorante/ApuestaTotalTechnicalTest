//
//  ApuestaTotalTechnicalTestApp.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 22/10/25.
//

import SwiftUI
import SwiftData

@main
struct ApuestaTotalTechnicalTestApp: App {
        
    var body: some Scene {
        WindowGroup {
            MainTabViewContainer()
                .modelContainer(for: MedalLocal.self)
        }
    }
}
