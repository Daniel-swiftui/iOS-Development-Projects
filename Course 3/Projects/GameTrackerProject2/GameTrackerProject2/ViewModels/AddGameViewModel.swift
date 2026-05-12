//
//  AddGameViewModel.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

@Observable
final class AddGameViewModel {
    var title: String = ""
    var sortHighest: Bool = true
    var winnerByHighest: Bool = true
    var pendingPlayerNames: [String] = []
    var newPlayerName: String = ""
    var showingIconPicker: Bool = false

    var availableIcons = [
        "person.fill", "star.fill", "bolt.fill",
        "flame.fill", "shield.fill", "scope", "target",
        "crown.fill"
    ]
    var selectedIcon: String = "gamecontroller.fill"

    var canSave: Bool { !title.trimmingCharacters(in: .whitespaces).isEmpty }

    func addPendingPlayer() {
        let trimmed = newPlayerName.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        pendingPlayerNames.append(trimmed)
        newPlayerName = ""
    }

    func removePendingPlayers(at offsets: IndexSet) {
        pendingPlayerNames.remove(atOffsets: offsets)
    }

    func save(context: ModelContext, existingCount: Int) {
        print("saving game")
        let game = Game(title: title, order: existingCount, sortHighest: sortHighest, winnerByHighest: winnerByHighest)
        context.insert(game)
        print("Game inserted")
        for name in pendingPlayerNames {
            let player = Player(name: name, iconName: selectedIcon)
            player.game = game
            game.players.append(player)
            context.insert(player)
        }
    }
}
