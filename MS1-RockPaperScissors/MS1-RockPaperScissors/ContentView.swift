//
//  ContentView.swift
//  MS1-RockPaperScissors
//
//  Created by Chloe Fermanis on 22/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var moves = ["👊🏾", "🖐🏾", "✌🏾"]
    var winningMoves = ["✌🏾","👊🏾","🖐🏾"]
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var round = 1
    
    @State private var showGameOverAlert = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 50) {
                
                
                VStack(spacing: 50) {
                    
                    Text("ROUND \(round)")
                            .font(.largeTitle)
                
                    
                    Text(moves[currentChoice])
                        .font(.system(size: 100))

                    
                    Text(shouldWin ? "You should win" : "You should lose")
                        .font(.title)
                        
                }
                        
                HStack {
                    
                    ForEach(0..<3) { number in
                                    
                        Button {
                            
                            buttonTapped(index: number)
                                
                        } label: {
                                
                            Text(moves[number])
                                .font(.system(size: 100))
                            
                        }
                        .alert("Game Over", isPresented: $showGameOverAlert) {
                            Button("OK") { newGame() }
                        }
                        
                    }
                }
                
                Text("SCORE: \(score)")
                    .foregroundColor(.mint)
                    .font(.title)


            }
            .navigationBarTitle("Rock, Paper, Scissors")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    newGame()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 25))
                        .tint(.mint)
                }
            }
        }
        
    }
    
    func buttonTapped(index: Int) {
                
        if round < 10  {
            
            if shouldWin {
                
                if moves[currentChoice] == winningMoves[index] {
                    score += 1
                } else if moves[currentChoice] == winningMoves[index] {
                    score += 1
                } else if moves[currentChoice] == winningMoves[index]  {
                    score += 1
                } else {
                    score -= 1
                }
                
            } else {
                
                if currentChoice == 0 && index != 1 {
                    score += 1
                } else if currentChoice == 1 && index != 2 {
                    score += 1
                } else if currentChoice == 2 && index != 0 {
                    score += 1
                } else {
                    score -= 1
                }
                
            }
            
            round += 1
            shouldWin = Bool.random()
            currentChoice = Int.random(in: 0...2)
            
        } else {
            showGameOverAlert = true
        }
            

    }
    
    
    func newGame() {
        score = 0
        round = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
