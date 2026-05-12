//
//  GameListView.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

struct GamesListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Game.order) private var games: [Game]

    @State private var viewModel = GamesViewModel()
    @State private var showingAddGame = false
    @Namespace private var namespace
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [Color(.systemBlue).opacity(0.9), Color(.systemTeal).opacity(0.3)],
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()

                if games.isEmpty {
                    emptyState
                        .transition(.opacity.combined(with: .scale))
                } else {
                    List {
                        ForEach(games) { game in
                            NavigationLink {
                                GameDetailView(game: game)
                            } label: {
                                GameRowView(game: game, namespace: namespace)
                            }
                            .listRowBackground(Color(.secondarySystemBackground))
                        }
                        .onDelete { offsets in
                            viewModel.deleteGames(at: offsets, from: games, context: context)
                        }
                        .onMove { src, dst in
                            viewModel.moveGames(games, from: src, to: dst)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .transition(.opacity)
                }
            }
            .navigationTitle("Games")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { EditButton() }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showingAddGame = true } label: {
                        Image(systemName: "plus")
                            .bold()
                            .symbolEffect(.bounce, value: showingAddGame)
                    }
                }
            }
            .sheet(isPresented: $showingAddGame) {
                AddGameView()
            }
            .animation(.easeInOut, value: games.count)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "gamecontroller")
                .font(.system(size: 64))
                .foregroundStyle(.blue)
                .symbolEffect(.pulse)
            Text("No Games Yet")
            Text("Tap + to create your first game")
                .foregroundStyle(.secondary)
        }
        .font(.custom("Burbank Big Condensed Black", size: 24))
    }
}

// games row view
struct GameRowView: View {
    let game: Game
    let namespace: Namespace.ID

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: "scope")
                .font(.title2)
                .foregroundStyle(.blue)
                .matchedGeometryEffect(id: "icon-\(game.id)", in: namespace)
                .frame(width: 40, height: 40)
                .background(Color.blue.opacity(0.12), in: Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text(game.title)
                    .font(.headline)
                Text(statusText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(game.date, style: .date)
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 6)
    }

    private var statusText: String {
        guard let leader = game.leader else { return "No players yet" }
        return "🏆 \(leader.name) · \(leader.score) pts"
    }
}


#Preview {
    GamesListView()
}
