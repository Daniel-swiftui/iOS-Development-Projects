//
//  Player.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftData
import Foundation

@Model
final class Player {
    var id: UUID
    var name: String
    var score: Int
    var iconName: String          
    var game: Game?

    init(name: String, iconName: String = "person.fill") {
        self.id = UUID()
        self.name = name
        self.score = 0
        self.iconName = iconName
    }
}
