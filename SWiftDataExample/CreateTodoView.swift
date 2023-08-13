//
//  CreateView.swift
//  SWiftDataExample
//
//  Created by Ravikanth Thummala on 8/13/23.
//

import SwiftUI
import SwiftData

struct CreateTodoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var item = ToDoItem()
    
    var body: some View {
        List{
            TextField("Name", text: $item.title)
            DatePicker("Choose a date", selection: $item.timestamp)
            Toggle("Important?", isOn: $item.isCritical)
            Button("Create") {
                withAnimation {
                    context.insert(item)
                }
                dismiss()

            }
        }
        .navigationTitle("Create Todo")
    }
}

#Preview {
    CreateTodoView()
        .modelContainer(for: ToDoItem.self)
}
