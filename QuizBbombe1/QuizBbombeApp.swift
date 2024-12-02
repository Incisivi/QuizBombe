//
//  QuizBbombeApp.swift
//  QuizBbombe
//
//  Created by Mark Rudat on 02.12.24.
//

import SwiftUI
import SwiftData

@main
struct QuizBbombeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            SettingsView()
//            ContentView()
            HilfsView() 
        }
        .modelContainer(sharedModelContainer)
    }
}
