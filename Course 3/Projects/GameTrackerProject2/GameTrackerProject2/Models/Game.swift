//
//  Game.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftData
import Foundation

@Model
final class Game {
    var id: UUID
    var title: String
    var date: Date
    var order: Int
    var sortHighest: Bool
    var winnerByHighest: Bool    
    @Relationship(deleteRule: .cascade) var players: [Player]

    init(title: String, order: Int = 0, sortHighest: Bool = true, winnerByHighest: Bool = true) {
        self.id = UUID()
        self.title = title
        self.date = Date()
        self.order = order
        self.sortHighest = sortHighest
        self.winnerByHighest = winnerByHighest
        self.players = []
    }

    // Returns players sorted per the game's sort preference
    var sortedPlayers: [Player] {
        sortHighest
            ? players.sorted { $0.score > $1.score }
            : players.sorted { $0.score < $1.score }
    }

    // The current winner/leader
    var leader: Player? { sortedPlayers.first }
}
