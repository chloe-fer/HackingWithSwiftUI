//
//  ContentView.swift
//  Project7-iExpense
//
//  Created by Chloe Fermanis on 29/11/21.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Paul", lastName: "Atreides")
    
    var body: some View {
    
        VStack {
            
            Text("\(user.firstName) \(user.lastName)")
                .padding()
            
            Button("Save User") {
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
