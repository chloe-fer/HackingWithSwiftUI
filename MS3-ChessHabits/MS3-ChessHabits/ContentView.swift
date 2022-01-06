//
//  ContentView.swift
//  MS3-ChessHabits
//
//  Created by Chloe Fermanis on 5/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habits = Habits()
    
    @State var showAddHabitView = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(Habit.allHabits) { habit in
                    
                    NavigationLink(destination: HabitDetailView()) {
                        
                        HStack {
                            
                            Image(systemName: "\(habit.currentStreak).circle")
                                .padding(.trailing, 9)
                                .font(.title)
                            
                            VStack(alignment: .leading) {
                                
                                Text(habit.name)
                                    .padding([.vertical], 1)
                                    
                                Text(habit.category.id)
                                    .foregroundColor(.secondary)
                                    
                            }
                        }
                    }
                    
                }
               // .onDelete(perform: removeRows)
                
               
            }
            .navigationTitle("Chess Habits")
            .toolbar {
                Button {
                    showAddHabitView.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            .sheet(isPresented: $showAddHabitView) {
                AddHabitView(habits: habits)
            }

        }
        
//        func removeRows(at offsets: IndexSet) {
//            Habit.remove(atOffsets: offsets)
//        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
