//
//  UpdateTodoView.swift
//  SWiftDataExample
//
//  Created by Ravikanth Thummala on 8/13/23.
//

import SwiftUI
import SwiftData

struct UpdateTodoView: View {
   
    @Environment(\.dismiss) var dismiss
    @Bindable var item: ToDoItem
      
      var body: some View {
          List {
              TextField("Name", text: $item.title)
              DatePicker("Choose a date",
                         selection: $item.timestamp)
              Toggle("Important?", isOn: $item.isCritical)
              Button("Update") {
                  dismiss()
              }
          }
          .navigationTitle("Update ToDo")
      }
}

