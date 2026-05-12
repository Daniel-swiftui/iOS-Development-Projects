//
//  AddPlayerViewModel.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

@Observable
final class AddPlayerViewModel {
    var name: String = ""
    var selectedIcon: String = "person.fill"

    let icons = [
        "person.fill", "star.fill", "bolt.fill",
        "flame.fill", "shield.fill", "scope", "target",
        "crown.fill"
    ]

    var canSave: Bool { !name.trimmingCharacters(in: .whitespaces).isEmpty }

    func save(to game: Game, context: ModelContext) {
        let player = Player(name: name.trimmingCharacters(in: .whitespaces), iconName: selectedIcon)
        player.game = game
        game.players.append(player)
        context.insert(player)
    }
}
