//
//  TripMapScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct TripMapScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    var trip: Trip
    
    @State var position: MapCameraPosition
    @State var selectedEntry: JournalEntry?
    @State private var isEditingTrip = false
    
    var body: some View {
        VStack {
            Map(position: $position, selection: $selectedEntry) {
                ForEach(trip.journalEntries) { journalEntry in
                    // Creates a pin on the map for every journal entry using its stored name and coordinates
                    if let coordinate = journalEntry.location.coordinate {
                        Marker(journalEntry.name, coordinate: coordinate)
                            .tag(journalEntry) // Allows the journal entry to be selected and stored in selectedEntry
                    }
                }
            }
            
            if selectedEntry != nil {
                // Show Journal bar with name, date, notes, and photos
                Journal(journalEntry: $selectedEntry)
            }
            
        }
        .navigationTitle(trip.name)
        .toolbar {
            Button("Edit") {
                // TODO: Add ability to edit trip name, delete trip
                isEditingTrip = true
            }
        }
        .sheet(isPresented: $isEditingTrip) {
            NavigationStack {
                EditTripScreen(trip: trip)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TripMapScreen(trip: Trip.mock(), position: .automatic)
    }
}
