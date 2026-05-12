//
//  ContentView.swift
//  SwiftDataJournal2
//
//  Created by Daniel Umpierrez on 4/27/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Journal.updatedAt, order: .reverse) private var journals: [Journal]

    @State private var showingAddJournal = false
    @State private var newJournalTitle = ""

    var body: some View {
        NavigationStack {
            Group {
                if journals.isEmpty {
                    ContentUnavailableView(
                        "No Journals Yet",
                        systemImage: "books.vertical",
                        description: Text("Tap + to create your first journal.")
                    )
                } else {
                    List {
                        ForEach(journals) { journal in
                            NavigationLink(destination: EntriesView(journal: journal)) {
                                JournalRow(journal: journal)
                            }
                        }
                        .onDelete(perform: deleteJournals)
                    }
                }
            }
            .navigationTitle("My Journals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddJournal = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .alert("New Journal", isPresented: $showingAddJournal) {
                TextField("Journal name", text: $newJournalTitle)
                Button("Create", action: addJournal)
                Button("Cancel", role: .cancel) {
                    newJournalTitle = ""
                }
            } message: {
                Text("Enter a name for your new journal.")
            }
        }
    }

    private func addJournal() {
        let title = newJournalTitle.trimmingCharacters(in: .whitespaces)
        newJournalTitle = ""
        guard !title.isEmpty else { return }
        let journal = Journal(title: title)
        modelContext.insert(journal)
        save()
    }

    private func deleteJournals(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(journals[index])
        }
        save()
    }

    private func save() {
        try? modelContext.save()
    }
}

struct JournalRow: View {
    let journal: Journal

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(journal.title)
                .font(.headline)
            Text("\(journal.entryCount) \(journal.entryCount == 1 ? "entry" : "entries")")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Entry.self, Journal.self], inMemory: true)
}
