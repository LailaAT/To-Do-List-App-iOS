//
//  Task.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import Foundation

//structs are value types
struct Task: Codable, Identifiable
{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) //determines whether a function is checked
    {
        isDone = state
    }
}
