//
//  EditTripScreen.swift
//  Trip Logger
//
//  Created by Daniel Umpierrez on 5/29/26.
//

import SwiftUI
import SwiftData
import MapKit

struct EditTripScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let trip: Trip
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        ZStack {
            Color.backGroundColor
                .ignoresSafeArea()
            VStack(spacing: 20) {
                
                TextField("Trip Name", text: Binding(
                    get: { trip.name },
                    set: { trip.name = $0 }
                ))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                
                Text("Tap the map to add more journal entries.")
                    .font(.headline)
                
                MapReader { reader in
                    
                    Map(position: $position) {
                        
                        ForEach(trip.journalEntries) { entry in
                            
                            if let coordinate = entry.location.coordinate {
                                
                                Marker(entry.name, coordinate: coordinate)
                            }
                        }
                    }
                    .onTapGesture { location in
                        placePin(reader: reader, location: location)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
                }
                
                List {
                    
                    ForEach(trip.journalEntries) { entry in
                        
                        NavigationLink {
                            EditJournalEntryScreen(entry: entry)
                        } label: {
                            Text(entry.name)
                                .foregroundStyle(.white)
                        }
                        .listRowBackground(Color.accentColor)
                    }
                    .onDelete(perform: deleteEntries)
                }
                .scrollContentBackground(.hidden)
                HStack {
                    Button("Delete Trip", role: .destructive) {
                        modelContext.delete(trip)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hue: 0.1, saturation: 0.1, brightness: 0.1, opacity: 0.1))
                    .foregroundStyle(.red)
                    Spacer()
                    Button("Done") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.accentColor)
                    
                }
                .padding(.horizontal, 30)
            }
            .padding()
            .navigationTitle("Edit Trip")
        }
    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        
        if let coordinate = reader.convert(location, from: .local) {
            
            let pinLocation = Location(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
            
            let newEntry = JournalEntry(
                name: "New Journal Entry",
                location: pinLocation,
                text: ""
            )
            
            trip.journalEntries.append(newEntry)
        }
    }
    
    func deleteEntries(at offsets: IndexSet) {
        trip.journalEntries.remove(atOffsets: offsets)
    }
}

#Preview {
    EditTripScreen(trip: Trip(name: "provo"))
}
