//
//  Projekt__GPT3_AppApp.swift
//  Projekt: GPT3_App
//
//  Created by WorkingAccount on 19.02.23.
//

import SwiftUI

@main
struct Projekt__GPT3_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
