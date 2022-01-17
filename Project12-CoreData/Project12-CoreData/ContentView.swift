//
//  ContentView.swift
//  Project12-CoreData
//
//  Created by Chloe Fermanis on 16/1/2022.
//

import SwiftUI

struct Student: Hashable {
    
    let name: String
    
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
