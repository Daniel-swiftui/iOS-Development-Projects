//
//  GameDetailViewModel.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

@Observable
final class GameDetailViewModel {
    var game: Game

    init(game: Game) { self.game = game }

    func incrementScore(for player: Player) {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
            player.score += 1
        }
    }

    func decrementScore(for player: Player) {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
            player.score -= 1
        }
    }

    func deletePlayers(at offsets: IndexSet, context: ModelContext) {
        let sorted = game.sortedPlayers
        withAnimation {
            for i in offsets {
                let player = sorted[i]
                game.players.removeAll { $0.id == player.id }
                context.delete(player)
            }
        }
    }

    func movePlayers(from source: IndexSet, to destination: Int) {
        var sorted = game.sortedPlayers
        sorted.move(fromOffsets: source, toOffset: destination)
       
        for (i, player) in sorted.enumerated() {
            player.score = sorted.count - i
        }
    }

    var leaderText: String {
        guard let leader = game.leader else { return "No players" }
        return "🏆 \(leader.name) · \(leader.score) pts"
    }
}

