//
//  REALToDoAppApp.swift
//  REALToDoApp
//
//  Created by Scholar on 6/27/23.
//

import SwiftUI

@main
struct REALToDoAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
          //  ContentView()
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
