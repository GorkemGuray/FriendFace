//
//  User.swift
//  FriendFace
//
//  Created by Görkem Güray on 24.08.2024.
//

import Foundation

struct User: Codable, Hashable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friends]
}
