//
//  ContentView.swift
//  Project8-Moonshot
//
//  Created by Chloe Fermanis on 1/12/21.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
//        let layout = [
//            GridItem(.fixed(80)),
//            GridItem(.fixed(80)),
//            GridItem(.fixed(80))
//        ]
        
//        let layout = [
//            GridItem(.adaptive(minimum: 80)),
//        ]
        
        let layout = [
            GridItem(.adaptive(minimum: 80, maximum: 120)),
        ]
        
        VStack {
            
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(0..<100) {
                        Text("Item \($0)")
                            .padding()
                    }
                }
            }
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout) {
                    ForEach(0..<100) {
                        Text("Item \($0)")
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
