//
//  AddView.swift
//  Project7-iExpense
//
//  Created by Chloe Fermanis on 29/11/21.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal", "Fun"]
        
    var body: some View {
        
        NavigationView {
            
            Form {
            
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                                
                //TextField("Amount", value: $amount, format: .currency(code: "USD"))
                
                
                
                // Challenge 1
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))

            }
            .navigationBarTitle("Add New Expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}



