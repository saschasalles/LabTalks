//
//  LabTalksApp.swift
//  Shared
//
//  Created by Sascha Sallès on 12/02/2021.
//

import SwiftUI

@main
struct LabTalksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
