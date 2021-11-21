//
//  ContentView.swift
//  Project3-ViewsAndModifiers
//
//  Created by Chloe Fermanis on 21/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

        VStack(spacing: 10) {
        
            Text("Modified Title")
                .modTitle()
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
            Text("Third")
                .modifier(Title())
            Text("Fourth")
                .titleStyle()
            Color.pink
                .frame(width: 300, height: 300, alignment: .center)
                .watermarked(with: "Hacking with Swift")
           
            }
    }
}

struct CapsuleText: View {
    
    var text: String
    
    var body: some View {
        
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ModTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct Watermark: ViewModifier {
    
    var text: String
    
    func body(content: Content) -> some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)

        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    
    func watermarked(with text: String) -> some View  {
        modifier(Watermark(text: text))
    }
    
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func modTitle() -> some View {
        modifier(ModTitle())
    }
}

