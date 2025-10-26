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
    
    @Environment(\.modelContext) var context
    
    var body: some Scene {
        WindowGroup {
            MedalsEntryView() // una vista que reciba el context
                .modelContainer(for: MedalLocal.self)        }
    }
}
