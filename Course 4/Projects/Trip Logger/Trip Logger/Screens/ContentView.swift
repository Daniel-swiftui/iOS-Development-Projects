//
//  ContentView.swift
//  Trip Logger
//
//  Created by Jane Madsen on 4/16/25.
//

import SwiftUI
import SwiftData
import MapKit
import PhotosUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var trips: [Trip]
    
    @State var isShowingNewTrip = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backGroundColor
                    .ignoresSafeArea()
                ViewThatFits {
                    if trips.isEmpty {
                        VStack {
                            Image(systemName: "mappin.and.ellipse.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250,height: 250)
                            Text("No trips yet.")
                                .font(.headline)
                                .bold()
                        }
                        .foregroundStyle(Color.accentColor)
                    } else {
                        List {
                            ForEach(trips) { trip in
                                NavigationLink(
                                    destination: TripMapScreen(
                                        trip: trip,
                                        position: .automatic
                                    )
                                ) {
                                    Text(trip.name)
                                        .foregroundStyle(.white)
                                        .fontWeight(.heavy)
                                        .bold()
                                             
                                }
                                .listRowBackground(Color.accentColor)
                            }
                            .onDelete(perform: deleteTrips)
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
                .navigationTitle("Trip Logger")
                .toolbar {
                    Button {
                        isShowingNewTrip = true
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                .sheet(isPresented: $isShowingNewTrip) {
                    NavigationStack {
                        NewTripScreen()
                    }
                }
            }
        }
    }
    private func deleteTrips(at offsets: IndexSet) {
        for index in offsets {
            let trip = trips[index]
            modelContext.delete(trip)
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(ModelContainer.preview)
}
