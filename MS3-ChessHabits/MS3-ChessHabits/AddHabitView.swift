//
//  AddHabitView.swift
//  MS3-ChessHabits
//
//  Created by Chloe Fermanis on 5/1/22.
//

import SwiftUI

struct AddHabitView: View {
    
    @ObservedObject var habits: Habits
    
    @State private var name = ""
    @State private var notes = ""
    
    @State private var bookTitle = ""
    @State private var bookAuthor = ""

    
    @State private var selectedCategory = Category.tactics
    
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Habit")) {
            
                TextField("Name", text: $name)
            
                Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        
                        }
                }
                .pickerStyle(MenuPickerStyle())
                
                //Text(selectedCategory.rawValue)
            }
            
            Section(header: Text("Notes")) {
                
                TextEditor(text: $notes)

            }
            
        }
        
    }
    
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
