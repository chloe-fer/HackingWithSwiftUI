//
//  ContentView.swift
//  Project5-WordScramble
//
//  Created by Chloe Fermanis on 24/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        
        
        NavigationView {
            
            List {
                
                Section {
                    
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                    
                }
                
                Section {
                    
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
        }
    }
    
    func addNewWord() {
        
        // lowercase newWord and remove white space
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // check that it has one character otherwise exit
        guard !answer.isEmpty else { return }
        
        // insert word at position 0 in usedWords array
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        // VALIDATION
        
        // set new word to empty string
        newWord = ""
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
