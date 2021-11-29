//
//  ContentView.swift
//  Project7-iExpense
//
//  Created by Chloe Fermanis on 29/11/21.
//

import SwiftUI

class User: ObservableObject {
    
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
    
}

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss

    let name: String
    
    
    var body: some View {
        
        VStack {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                dismiss()
            }
        }
        
    }
}

struct ContentView: View {
    
    @StateObject var user = User()
    
    @State private var showingSheet = false
    
    var body: some View {
        
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
                .padding()
            
            TextField("First name", text: $user.firstName)
                .textFieldStyle(.roundedBorder)

            TextField("Last name", text: $user.lastName)
                .textFieldStyle(.roundedBorder)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "@twostraws")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
