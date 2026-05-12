//
//  GameViewModel.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

@Observable
final class GamesViewModel {
        func deleteGames(at offsets: IndexSet, from games: [Game], context: ModelContext) {
        withAnimation {
            for index in offsets { context.delete(games[index]) }
            
            let remaining = games.enumerated().filter { !offsets.contains($0.offset) }.map(\.element)
            for (index, game) in remaining.enumerated() { game.order = index }
        }
    }

    func moveGames(_ games: [Game], from source: IndexSet, to destination: Int) {
        var reordered = games
        reordered.move(fromOffsets: source, toOffset: destination)
       
        for (index, game) in reordered.enumerated() {
            game.order = index
        }
    }

    func statusText(for game: Game) -> String {
        guard let leader = game.leader else { return "No players yet" }
        let label = game.winnerByHighest ? "Leading" : "Leading (low score)"
        return "\(leader.name) \(label) · \(leader.score) pts"
    }
}
