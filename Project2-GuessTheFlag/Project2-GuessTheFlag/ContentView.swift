//
//  ContentView.swift
//  Project2-GuessTheFlag
//
//  Created by Chloe Fermanis on 18/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0 ..< 3)
    
    @State private var showingScore = false
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var gameOver = false
        
    @State private var questionNumber = 1
    
    @State private var rotationAmount = 0.0
    @State private var opacityAmount = 1.0
    @State private var scaleAmount = 1.0
        
    var body: some View {
        
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                                
                VStack(spacing: 15) {
                    
                    VStack {
                        
                        Text("Select the flag from ")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            
                            flagTapped(number)
                            
                        } label: {
                            FlagView(countryName: countries[number])
                        }
                        // Challenge 1:
                        //.rotation3DEffect(.degrees(number == correctAnswer ? rotationAmount : 0.0), axis: (x: 0, y: 1, z: 0))
                        // Challenge 2
                        //.opacity(number == correctAnswer ? 1.0 : opacityAmount)
                        // Challeng 3: 
                        //.scaleEffect(scaleAmount)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            

        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
                .foregroundColor(.white)
                .font(.title.bold())
        }
        .alert("Game Over", isPresented: $gameOver) {
            Button("Play again!", action: resetGame)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        

        if number == correctAnswer {
            
            withAnimation {
                rotationAmount = 360
                opacityAmount = 0.25
                scaleAmount = 0.5
            }
            
            score += 1
            scoreTitle = "Correct"

        } else {
            score -= 1
            opacityAmount = 0.0
            scoreTitle = "Incorrect, that is the flag of \(countries[number])"
        }
        
        if questionNumber == 8 {
            gameOver = true
        } else {
            showingScore = true
        }
        questionNumber += 1
                
    }
    
    func askQuestion() {
        countries.shuffle()
        opacityAmount = 1.0
        rotationAmount = 0.0
        scaleAmount = 1.0
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        questionNumber = 1
        score = 0
    }
}

// Day 24 - challenge 2: refactor code
struct FlagView: View {
    
    var countryName: String
    
    var body: some View {
        
        Image(countryName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
