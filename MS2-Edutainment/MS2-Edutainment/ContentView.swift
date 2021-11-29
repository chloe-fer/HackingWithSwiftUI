//
//  ContentView.swift
//  MS2-Edutainment
//
//  Created by Chloe Fermanis on 28/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var numberOfQuestions = [5, 10, 20]
    
    @State private var multiplicationType = 2
    @State private var selectedQuestionNumber = 5
    
    @State private var multiple = Int.random(in: 0...12)
    @State private var answer = 0
    
    @State private var showGameOverAlert = false
    
    @State private var score = 0
    @State private var questionNumber = 1
    
    @State private var markedAnswer = false
    
    var body: some View {
        
        
        VStack {
            
            Text("Multiplication!")
                .font(.largeTitle)
                .padding()
            
            Stepper("Practice your \(multiplicationType) times tables", value: $multiplicationType, in: 2...12)
        
            Picker("How many questions", selection: $selectedQuestionNumber) {
                ForEach(numberOfQuestions, id: \.self) {
                    Text("\($0)")
        
                }
            }
            .pickerStyle(.segmented)
            
        
            if questionNumber < selectedQuestionNumber+2 {
           
                Text("Question: \(questionNumber)")
                    .padding()
                
            }
            
            
            Text("\(multiple) x \(multiplicationType)")
                .font(.title)
                .padding()
                        
            
            VStack(alignment: .leading) {
                Text("ENTER YOUR ANSWER:")
                    .font(.caption)
                TextField("Answer", value: $answer, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 5)
            }
            
            if questionNumber > 1 {
                Image(systemName: markedAnswer ? "checkmark.shield.fill" : "xmark.shield.fill")
                    .foregroundColor(markedAnswer ? .green : .red)
                    .font(.largeTitle)
                    .padding()
            }
                
            
            Text("SCORE: \(score) : \(selectedQuestionNumber)")
                .padding()
            
        }
        .padding()
        .onSubmit(validate)
        .alert("Game Over", isPresented: $showGameOverAlert, actions: {
            Button("Play Again!") {
                questionNumber = 1
                score = 0
            }
        }, message: {
            Text("Great effort, you scored \(score) : \(selectedQuestionNumber).")
        })
    }
    
    func validate() {
                
        let correctAnswer = multiplicationType * multiple
                    
        if answer ==  correctAnswer {
            markedAnswer = true
            questionNumber += 1
            score += 1
            multiple = Int.random(in: 0...12)
            
        } else {
            score -= 1
            markedAnswer = false
        }
        
        if questionNumber == selectedQuestionNumber+1 {
            showGameOverAlert = true
            markedAnswer = true
        }
        
        answer = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
