//
//  EntriesView.swift
//  SwiftDataJournal2
//
//  Created by Daniel Umpierrez on 4/30/26.
//

import SwiftUI
import SwiftData

struct EntriesView: View {
    @Environment(\.modelContext) private var modelContext
    let journal: Journal

    @State private var showingAddEdit = false
    @State private var entryToEdit: Entry? = nil

    // Use the relationship directly instead of @Query
    private var sortedEntries: [Entry] {
        journal.entries.sorted { $0.updatedAt > $1.updatedAt }
    }

    var body: some View {
        Group {
            if sortedEntries.isEmpty {
                ContentUnavailableView(
                    "No Entries",
                    systemImage: "square.and.pencil",
                    description: Text("Tap + to write your first entry.")
                )
            } else {
                List {
                    ForEach(sortedEntries) { entry in
                        Button {
                            entryToEdit = entry
                        } label: {
                            EntryRow(entry: entry)
                        }
                        .buttonStyle(.plain)
                    }
                    .onDelete(perform: deleteEntries)
                }
            }
        }
        .navigationTitle(journal.title)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    entryToEdit = nil
                    showingAddEdit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
        .sheet(isPresented: $showingAddEdit) {
            AddEditEntryView(journal: journal, entry: nil)
        }
        .sheet(item: $entryToEdit) { entry in
            AddEditEntryView(journal: journal, entry: entry)
        }
    }

    private func deleteEntries(at offsets: IndexSet) {
        let sorted = sortedEntries
        for index in offsets {
            modelContext.delete(sorted[index])
        }
        journal.updatedAt = Date()
        save()
    }

    private func save() {
        try? modelContext.save()
    }
}

struct EntryRow: View {
    let entry: Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(entry.title)
                .font(.headline)
                .lineLimit(1)
            if !entry.body.isEmpty {
                Text(entry.body)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            Text(entry.updatedAt.formatted(.relative(presentation: .named)))
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 4)
    }
}

