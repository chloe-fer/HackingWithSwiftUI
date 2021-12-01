//
//  ContentView.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                NavigationLink {
                    Text("Detail \(item)")
                } label: {
                    Text("Row \(item)")
                        .padding()
                }
            .navigationTitle("SwiftUI")
            }
            
        }
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
