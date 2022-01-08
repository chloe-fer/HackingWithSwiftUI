//
//  ContentView.swift
//  Project10-CupcakeCorner
//
//  Created by Chloe Fermanis on 7/1/22.
//

import SwiftUI


struct ContentView: View {
        
    var body: some View {
        
        // AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        
        // AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
            // .resizable() doesn't work with async
            // .frame(width: 200, height: 200) doesn't work with async or regular image

        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            
            if let image = phase.image {
                
                image
                    .resizable()
                    .scaledToFit()
                
            } else if phase.error != nil {
                Text("There was an error loading in the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
