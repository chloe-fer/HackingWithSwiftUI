//
//  Habit.swift
//  MS3-ChessHabits
//
//  Created by Chloe Fermanis on 5/1/22.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    
    case tactics = "Tactics"
    case annotated = "Annotated Games"
    case books = "Books"
    case openings = "Opening Theory"
    case endGames = "End Games"
    case analysis = "Analysis"
    case strategy = "Strategy"
    
    var id: String { self.rawValue }
    // var id: Category { self }

}

struct Habit: Identifiable {
    
    let id = UUID()
    var name: String
    var category: Category
    var note: String
    //var date: Date
    var currentStreak: Int
    // var bestStreak: Int
    
}

class Habits: ObservableObject {
    
    @Published var habits = [Habit]()
}

extension Habit {
    
    static let allHabits: [Habit] = [
    
        Habit(name: "Woodpecker Method", category: .tactics, note: "A set of 200 repeat 5 times.", currentStreak: 0),
        
        Habit(name: "French", category: .openings, note: "Chessable", currentStreak: 0),

        Habit(name: "Logical Chess: Move by Move", category: .books, note: "Irving Chernev", currentStreak: 0)
    ]
}
