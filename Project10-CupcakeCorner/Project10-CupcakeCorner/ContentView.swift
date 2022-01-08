//
//  ContentView.swift
//  Project10-CupcakeCorner
//
//  Created by Chloe Fermanis on 7/1/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
        
    var body: some View {
        
        Form {
            
            Section {
                
                TextField("Name", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                
                Button("Create Account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
