//
//  SWiftDataExampleApp.swift
//  SWiftDataExample
//
//  Created by Ravikanth Thummala on 8/13/23.
//

import SwiftUI
import SwiftData

@main
struct SWiftDataExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDoItem.self)
    }
}
