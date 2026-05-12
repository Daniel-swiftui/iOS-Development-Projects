//
//  AddPlayerView.swift
//  GameTrackerProject2
//
//  Created by Daniel Umpierrez on 5/8/26.
//

import SwiftUI
import SwiftData

struct AddPlayerView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    let game: Game
    @State private var viewModel = AddPlayerViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(.systemBlue).opacity(0.9), Color(.systemTeal).opacity(0.3)],
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()
                

                Form {

                    Section("Player Info") {
                        TextField("Player Name", text: $viewModel.name)
                    }

                    Section("Choose Icon") {
                        LazyVGrid(
                            columns: Array(
                                repeating: GridItem(.flexible()),
                                count: 6
                            ),
                            spacing: 12
                        ) {
                            ForEach(viewModel.icons, id: \.self) { icon in
                                Image(systemName: icon)
                                    .font(.title2)
                                    .padding(10)
                                    .background(
                                        viewModel.selectedIcon == icon ? Color.blue : Color(.secondarySystemBackground),
                                        in: RoundedRectangle(cornerRadius: 10)
                                    )
                                    .foregroundStyle(
                                        viewModel.selectedIcon == icon ? .white : .black
                                    )
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.3)) {
                                            viewModel.selectedIcon = icon
                                        }
                                    }
                            }
                        }
                        .padding(.vertical, 6)
                    }

                    // Live preview of player being created
                    Section("Preview") {
                        HStack(spacing: 12) {
                            Image(systemName: viewModel.selectedIcon)
                                .font(.title3)
                                .foregroundStyle(.blue)
                                .frame(width: 36, height: 36)
                                .background(
                                    Color.blue.opacity(0.12),
                                    in: Circle()
                                )

                            Text(
                                viewModel.name.isEmpty ? "Player Name" : viewModel.name
                            )
                            .foregroundStyle(
                                viewModel.name.isEmpty ? .secondary : .primary
                            )

                            Spacer()

                            Text("0")
                                .font(.title3.bold())
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Add Player")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        withAnimation {
                            viewModel.save(to: game, context: context)
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
    AddPlayerView(game: Game(title: "Zero Build"))
}
