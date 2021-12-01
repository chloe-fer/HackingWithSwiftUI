//
//  ContentView.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GeometryReader { geo in
            Image("alice")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width*0.8, height: geo.size.height*0.8)
                .frame(width: geo.size.width, height: geo.size.height)

                
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
