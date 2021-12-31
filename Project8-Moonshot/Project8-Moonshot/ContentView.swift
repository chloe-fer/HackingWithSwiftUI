//
//  ContentView.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 1/12/21.
//

import SwiftUI


struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showingGrid = true
    
    var body: some View {
        
        NavigationView {
            
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationTitle("Moonshot")
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Text("List")
                            .foregroundColor(.white)
                    } else {
                        Text("Grid")
                            .foregroundColor(.white.opacity(0.5))

                    }
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
