//
//  SwiftDataJournal2App.swift
//  SwiftDataJournal2
//
//  Created by Daniel Umpierrez on 4/27/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataJournalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Entry.self, Journal.self], inMemory: true)
    }
}
