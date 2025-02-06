//
//  ListItem.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import Foundation

struct ListItem : Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
