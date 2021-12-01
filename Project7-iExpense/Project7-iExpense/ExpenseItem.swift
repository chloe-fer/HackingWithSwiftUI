//
//  ExpenseItem.swift
//  Project7-iExpense
//
//  Created by Chloe Fermanis on 29/11/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
