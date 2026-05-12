//
//  GameDetailView.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

struct GameDetailView: View {
    @Environment(\.modelContext) private var context
    @State var viewModel: GameDetailViewModel
    @State private var showingAddPlayer = false
    @Namespace private var listNamespace

    init(game: Game) {
        _viewModel = State(initialValue: GameDetailViewModel(game: game))
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(
                colors: [Color(.systemBlue).opacity(0.9), Color(.systemTeal).opacity(0.3)],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()
            
            List {
                // Leader banner
                if let leader = viewModel.game.leader {
                    Section {
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundStyle(.yellow)
                            Text("\(leader.name) is leading with \(leader.score) pts")
                                .font(.subheadline.bold())
                        }
                        .listRowBackground(Color.blue.opacity(0.15))
                    }
                    .transition(.move(edge: .top).combined(with: .opacity))
                }

                // Player rows
                Section("Players") {
                    ForEach(viewModel.game.sortedPlayers) { player in
                        PlayerRowView(
                            player: player,
                            namespace: listNamespace,
                            onIncrement: { viewModel.incrementScore(for: player) },
                            onDecrement: { viewModel.decrementScore(for: player) }
                        )
                        .listRowBackground(Color(.secondarySystemBackground))
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing).combined(with: .opacity),
                            removal: .move(edge: .leading).combined(with: .opacity)
                        ))
                    }
                    .onDelete { offsets in
                        viewModel.deletePlayers(at: offsets, context: context)
                    }
                    .onMove(perform: viewModel.movePlayers)
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .animation(.spring(response: 0.4, dampingFraction: 0.75), value: viewModel.game.sortedPlayers.map(\.score))
        }
        .navigationTitle(viewModel.game.title)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) { EditButton() }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingAddPlayer = true
                } label: {
                    Image(systemName: "person.badge.plus")
                        .symbolEffect(.bounce, value: showingAddPlayer)
                }
            }
        }
        .sheet(isPresented: $showingAddPlayer) {
            AddPlayerView(game: viewModel.game)
        }
    }
}

// player row view
struct PlayerRowView: View {
    let player: Player
    let namespace: Namespace.ID
    let onIncrement: () -> Void
    let onDecrement: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            
            Image(systemName: player.iconName)
                .font(.title3)
                .foregroundStyle(.blue)
                .frame(width: 36, height: 36)
                .background(Color.blue.opacity(0.12), in: Circle())
                .matchedGeometryEffect(id: player.id, in: namespace)

            Text(player.name)
                .font(.body.weight(.medium))
                .lineLimit(1)

            Spacer()

            // Stepper
            HStack(spacing: 4) {
                Button { onDecrement() } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.red.opacity(0.8))
                }
                .buttonStyle(.plain)

                Text("\(player.score)")
                    .font(.title3.bold().monospacedDigit())
                    .frame(minWidth: 38)
                    .contentTransition(.numericText())

                Button { onIncrement() } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.green.opacity(0.9))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    GameDetailView(game: Game(title: "Zero Build"))
}
