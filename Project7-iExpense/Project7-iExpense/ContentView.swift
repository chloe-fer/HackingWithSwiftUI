//
//  ContentView.swift
//  Project7-iExpense
//
//  Created by Chloe Fermanis on 29/11/21.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                // Challenge 3
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            ItemRow(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)

                } header: {
                    Text("Personal")
                }


                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            ItemRow(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)

                } header: {
                    Text("Business")
                }

                Section {
                    ForEach(expenses.items) { item in
                        if item.type == "Fun" {
                            ItemRow(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)

                } header: {
                    Text("Fun")
                }
            }
                
            
            .navigationBarTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ItemRow: View {
    
    var item: ExpenseItem

    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            
            // Challenge 2
            if item.amount > 100 {
                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(.blue)
                    .cornerRadius(10.0)
            } else {
                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(item.amount < 10 ? .red : .green)
                    .cornerRadius(10.0)

            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
