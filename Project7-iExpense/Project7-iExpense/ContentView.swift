//
//  ContentView.swift
//  Project7-iExpense
//
//  Created by Chloe Fermanis on 29/11/21.
//

import SwiftUI


struct ContentView: View {
    
    @AppStorage("tapCount") private var tapCount = 0

    // UserDefaults.standard.set(self.tapCount, forKey: "Tap")
    
    var body: some View {
    
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            // UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
