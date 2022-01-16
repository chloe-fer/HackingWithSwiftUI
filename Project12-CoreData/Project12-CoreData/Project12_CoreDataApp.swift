//
//  Project12_CoreDataApp.swift
//  Project12-CoreData
//
//  Created by Chloe Fermanis on 16/1/2022.
//

import SwiftUI

@main
struct Project12_CoreDataApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
