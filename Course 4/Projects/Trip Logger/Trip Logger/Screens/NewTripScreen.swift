//
//  NewTripView.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/29/25.
//

import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct NewTripScreen: View {
    @State private var tripName: String = ""

    var body: some View {
        ZStack {
            Color.backGroundColor
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("First, give a name to your trip.")
                    .font(.title2)
                    .fontWeight(.bold)
                
                TextField("Trip Name", text: $tripName)
                    .textFieldStyle(.roundedBorder)
                
                NavigationLink {
                    let trip = Trip(name: tripName)
                    PlacePinScreen(trip: trip)
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    tripName
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                        .isEmpty
                )
                .accentColor(Color.accentColor)
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Trip")
        }
    }
}

#Preview {
    NewTripScreen()
        .modelContainer(ModelContainer.preview)
}
