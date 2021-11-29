//
//  The_BrawlApp.swift
//  The Brawl
//
//  Created by rémy seillier on 29/11/2021.
//

import SwiftUI

@main
struct The_BrawlApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
