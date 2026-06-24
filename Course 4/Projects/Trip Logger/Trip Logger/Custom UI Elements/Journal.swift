//
//  Journal.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct Journal: View {
    @Binding var journalEntry: JournalEntry?
    var body: some View {
        JournalTopBar(journalEntry: $journalEntry)
            .padding()
        
        if let journalEntry {
            Text(journalEntry.date.formatted(date: .abbreviated, time: .omitted))
                .font(.headline)
            Text(journalEntry.text)
                .font(.body)
            
            PhotoScrollView(journalEntry: journalEntry)
        }
    }
}



struct JournalTopBar: View {
    @Binding var journalEntry: JournalEntry?
    
    var body: some View {
        HStack {
            Button("Edit") {
                // TODO: Add ability to edit journal entries
            }
            
            Spacer()
            
            Text(journalEntry?.name ?? "Journal")
                .font(.title)
            
            Spacer()
            
            Button("Dismiss") {
                journalEntry = nil
            }
        }
    }
}

#Preview {
    @Previewable @State var trip = Trip.mock()
    
    TripMapScreen(trip: trip, position: .automatic, selectedEntry: trip.journalEntries.first)
}
