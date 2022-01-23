//
//  chronologyApp.swift
//  Shared
//
//  Created by Halcyone Rapp on 1/22/22.
//


import SwiftUI

@main
struct chronologyApp: App {
    
   @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
