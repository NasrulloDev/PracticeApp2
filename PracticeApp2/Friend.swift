//
//  Friend.swift
//  PracticeApp2
//
//  Created by Насрулло Исмоилжонов on 25/02/24.
//

import Foundation
import SwiftData

@Model
class Friend: Codable {
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
    }
    
    var id: String
    var name: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
    
}
