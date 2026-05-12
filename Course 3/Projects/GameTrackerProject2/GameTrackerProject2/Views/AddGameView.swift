//
//  AddGameView.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

struct AddGameView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Game.order) private var games: [Game]
    
    @State private var viewModel = AddGameViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(.systemBlue).opacity(0.9), Color(.systemTeal).opacity(0.3)],
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()
                
                Form {
                    
                    Section("Game Info") {
                        TextField("Game Title", text: $viewModel.title)
                    }
                    
                    Section("Scoring Options") {
                        Toggle("Sort players: Highest first", isOn: $viewModel.sortHighest)
                        
                        Toggle("Winner: Highest score",
                               isOn: $viewModel.winnerByHighest)
                    }
                    
                    Section("Player Icon") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.availableIcons, id: \.self) { icon in
                                    Image(systemName: icon)
                                        .font(.title2)
                                        .padding(10)
                                        .background(
                                            viewModel.selectedIcon == icon ? Color.blue : Color(.secondarySystemBackground),
                                            in: RoundedRectangle(cornerRadius: 10)
                                        )
                                        .foregroundStyle(
                                            viewModel.selectedIcon == icon ? .white : .primary
                                        )
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.3)) {
                                                viewModel.selectedIcon = icon
                                            }
                                        }
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    
                    Section("Players") {
                        ForEach(viewModel.pendingPlayerNames, id: \.self) { name in
                            Label(name, systemImage: viewModel.selectedIcon)
                        }
                        .onDelete(perform: viewModel.removePendingPlayers)
                        
                        HStack {
                            TextField("Player name", text: $viewModel.newPlayerName)
                            
                            Button("Add") {
                                withAnimation {
                                    viewModel.addPendingPlayer()
                                }
                            }
                            .disabled(
                                viewModel.newPlayerName
                                    .trimmingCharacters(in: .whitespaces)
                                    .isEmpty
                            )
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("New Game")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            viewModel.save(
                                context: context,
                                existingCount: games.count
                            )
                        }
                        dismiss()
                    }
                    .disabled(!viewModel.canSave)
                    .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    AddGameView()
}
