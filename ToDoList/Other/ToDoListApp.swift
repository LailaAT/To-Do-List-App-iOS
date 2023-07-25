//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
