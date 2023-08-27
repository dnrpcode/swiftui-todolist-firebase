//
//  User.swift
//  ToDoList
//
//  Created by dani prayogi on 26/08/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
