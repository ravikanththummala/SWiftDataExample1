//
//  ContentView.swift
//  SWiftDataExample
//
//  Created by Ravikanth Thummala on 8/13/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ToDoItem]
    @State private var showCreate = false
    @State private var todoToEdit: ToDoItem?
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading){
                            Image(systemName: "exclamationmark.3")
                                .symbolVariant(.fill)
                                .foregroundStyle(.red)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                            Text("\(item.timestamp,format: Date.FormatStyle(date: .numeric,time: .shortened))")
                        }
                        Spacer()
                        
                        
                        Button {
                            withAnimation {
                                item.isCompleted.toggle()
                            }
                        } label: {
                            
                            Image(systemName: "checkmark")
                                .symbolVariant(.circle.fill)
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.largeTitle)
                        }
                        .buttonStyle(.plain)
                    }
                    .swipeActions{
                        Button(role: .destructive) {
                            
                            withAnimation {
                                modelContext.delete(item)
                            }
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(.fill)
                        }
                        
                        Button(action: {
                            todoToEdit = item
                        }, label: {
                            Label("Edit", systemImage: "pencil")
                        })
                        .tint(.orange)
                    }
                    
                }
            }
            .navigationTitle("My To do List")
            .toolbar(content: {
                Button(action: {
                    showCreate.toggle()
                }, label: {
                    Label("Add Item", systemImage: "plus")
                })
            })
            
        }.sheet(isPresented: $showCreate, content: {
            NavigationStack{
                CreateTodoView()
            }
            .presentationDetents([.medium])
        })
        .sheet(item: $todoToEdit) {
            todoToEdit = nil
        } content: { item in
            UpdateTodoView(item: item)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
