//
//  AddEditEntryView.swift
//  SwiftDataJournal2
//
//  Created by Daniel Umpierrez on 4/27/26.
//

import SwiftUI
import SwiftData

struct AddEditEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let journal: Journal
    let entry: Entry?          

    @State private var title: String = ""
    @State private var entryBody: String = ""

    private var isEditing: Bool { entry != nil }

    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Entry title", text: $title)
                }

                Section("Journal Entry") {
                    TextEditor(text: $entryBody)
                        .frame(minHeight: 200)
                }
            }
            .navigationTitle(isEditing ? "Edit Entry" : "New Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Save" : "Add") {
                        saveEntry()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                    .fontWeight(.semibold)
                }
            }
            .onAppear {
                // Pre-populate fields in edit mode
                if let entry {
                    title = entry.title
                    entryBody = entry.body
                }
            }
        }
    }

    private func saveEntry() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
        guard !trimmedTitle.isEmpty else { return }

        if let entry {
            // Edit mode: update existing entry
            entry.title = trimmedTitle
            entry.body = entryBody
            entry.updatedAt = Date()
        } else {
            // Create mode: insert new entry linked to the journal
            let newEntry = Entry(title: trimmedTitle, body: entryBody, journal: journal)
            modelContext.insert(newEntry)
        }

        // Touch journal's updatedAt so the journals list stays sorted correctly
        journal.updatedAt = Date()

        save()
        dismiss()
    }

    private func save() {
        try? modelContext.save()
    }
}


