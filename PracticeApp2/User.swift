//
//  User.swift
//  PracticeApp2
//
//  Created by Насрулло Исмоилжонов on 25/02/24.
//

import Foundation

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    
    var friends: [Friend]
}
