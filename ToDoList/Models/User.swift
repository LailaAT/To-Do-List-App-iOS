//
//  User.swift
//  ToDoList
//
//  Created by Laila Tantavy on 19/06/2023.
//

import Foundation
struct User: Codable 
{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
