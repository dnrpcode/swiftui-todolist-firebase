//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
