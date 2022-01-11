//
//  Project11_BookwormApp.swift
//  Project11-Bookworm
//
//  Created by Chloe Fermanis on 11/1/2022.
//

import SwiftUI

@main
struct Project11_BookwormApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
