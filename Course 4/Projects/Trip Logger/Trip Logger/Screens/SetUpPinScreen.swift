//
//  SetUpPinScreen.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//


import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct SetUpPinScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var trip: Trip
    
    var body: some View {
        
        let entry = trip.journalEntries.first!
        ZStack {
            Color.backGroundColor
                .ignoresSafeArea()
            VStack {
                Text("Name your first pin, add photos, and add notes to this stop")
                    .font(.headline)
                    .padding(.top)
                TextField("Pin Name", text: Binding(get: {entry.name}, set: { entry.name = $0}))
                    .textFieldStyle(.roundedBorder)
                TextField("Notes", text: Binding( get: {entry.text}, set: {entry.text = $0}))
                    .textFieldStyle(.roundedBorder)
                
                PhotoScrollView(journalEntry: entry)
                
                Spacer()
                
                Button {
                    modelContext.insert(trip)
                    dismiss()
                } label: {
                    Text("Save Trip")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
                .accentColor(Color.accentColor)
            }
            .padding()
            .navigationTitle("Set Up Pin")
        }
    }
}

#Preview {
    SetUpPinScreen(trip: Trip(name: "provo"))
}
