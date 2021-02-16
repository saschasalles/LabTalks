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
    @State private var isWelcomePresented = true
    var body: some Scene {
        WindowGroup {
            if self.isWelcomePresented {
                WelcomeView(isWelcomePresented: self.$isWelcomePresented)
            } else {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
