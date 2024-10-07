//
//  Intefaz_ExogameApp.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//

import SwiftUI

@main
struct epApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
