//
//  ContentView.swift
//  Project11-Bookworm
//
//  Created by Chloe Fermanis on 11/1/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [
        
        SortDescriptor(\.title),
        SortDescriptor(\.author)
        
        // SortDescriptor(\.title, order: .reverse)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddSreen = false

    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(books) { book in
                    
                    NavigationLink {
                        
                        DetailView(book:book)
                        
                    } label: {
                        
                        HStack {
                            
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                    // Challenge 2: red title text for 1 star rating
                                    .foregroundColor(book.rating == Int(1) ? .red : .black)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddSreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddSreen) {
                AddBookView()
            }
        }
        
    }
    
    func deleteBooks(at offsets: IndexSet) {
        
        for offset in offsets {
            
            // find book in fetch request
            let book = books[offset]
            
            // delte book from context
            moc.delete(book)
        }
        try? moc.save()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
