//
//  ContentView.swift
//  Project11-Bookworm
//
//  Created by Chloe Fermanis on 11/1/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rememberMe = false
    
    var body: some View {
        
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
                .foregroundColor(rememberMe ? .red : .secondary)
                .bold()
        }
    }
}

struct PushButton: View {
    
    let title: String
    
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.pink]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
