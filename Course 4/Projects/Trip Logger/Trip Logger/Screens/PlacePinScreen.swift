//
//  PlacePinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct PlacePinScreen: View {
    @State var trip: Trip
    
    var body: some View {
        ZStack {
            Color.backGroundColor
                .ignoresSafeArea()
            VStack {
                
                Text("Tap on the map to place your frist pin.")
                    .font(.headline)
                    .padding(.top)
                
                MapReader { reader in // Allows conversion of a touch gesture into coordinates
                    Map {
                        // TODO: Display the pin the user placed
                        ForEach(trip.journalEntries) { JournalEntry in
                            if let mapItem = JournalEntry.location.mapItem {
                                Marker(item: mapItem)
                            }
                        }
                    }
                    .onTapGesture { location in
                        placePin(reader: reader, location: location)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
                }
                NavigationLink {
                    SetUpPinScreen(trip: trip)
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .disabled(trip.journalEntries.isEmpty)
                .accentColor(Color.accentColor)
            }
            .navigationTitle("Place First Pin")
        }
    }
    
    func placePin(reader: MapProxy, location: CGPoint) {
        
        if let coordinate = reader.convert(location, from: .local) {
            
            let pinLocation = Location(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
            
            let journalEntry = JournalEntry(
                name: "New Journal Entry",
                location: pinLocation,
                text: ""
            )
            
            trip.journalEntries.append(journalEntry)
        }
    }
}

#Preview {
    PlacePinScreen(trip: Trip(name: "provo"))
        .modelContainer(ModelContainer.preview)
}
