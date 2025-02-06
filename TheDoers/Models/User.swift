//
//  User.swift
//  TheDoers
//
//  Created by Edu Caubilla on 4/2/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
