//
//  EditJournalEntryScreen.swift
//  Trip Logger
//
//  Created by Daniel Umpierrez on 5/29/26.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditJournalEntryScreen: View {
    
    let entry: JournalEntry
    
    var body: some View {
        ZStack {
            Color.backGroundColor
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                TextField("Entry Name", text: Binding(
                    get: { entry.name },
                    set: { entry.name = $0 }
                ))
                .textFieldStyle(.roundedBorder)
                
                TextField("Notes", text: Binding(
                    get: { entry.text },
                    set: { entry.text = $0 }
                ), axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(5...10)
                
                PhotoScrollView(journalEntry: entry)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Edit Entry")
        }
    }
}

#Preview {
    EditJournalEntryScreen(entry: JournalEntry(name: "provo"))
}
