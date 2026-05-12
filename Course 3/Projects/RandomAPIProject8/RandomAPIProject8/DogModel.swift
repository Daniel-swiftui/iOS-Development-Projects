//
//  DogModel.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/21/26.
//

import Foundation

struct Dog: Codable, Identifiable {
    var id: UUID = UUID()
    let message: String
    let status: String
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case message, status
    }
}

