//
//  RepresentativeView.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/20/26.
//

import SwiftUI

struct RepresentativeView: View {
    @State private var searchText: String = ""
    @State private var representatives: [Representative] = []
    @State private var isLoading = false
    
    let api = RepresentativeAPIController()
    
    var body: some View {
        VStack {
            TextField("Enter ZIP Code", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .padding()
                .keyboardType(.numberPad)
            
            Button("Search") {
                Task {
                    await fetchRepresentatives()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
            .disabled(searchText.isEmpty)
            
            if isLoading {
                ProgressView()
            }
            
            List(representatives) { rep in
                VStack(alignment: .leading) {
                    Text(rep.name)
                        .font(.headline)
                    Text(rep.party)
                        .font(.subheadline)
                    Text(rep.state)
                        .font(.caption)
                    Text(rep.link)
                        .font(.caption)
                }
            }
        }
    }
    
    func fetchRepresentatives() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            representatives = try await api.fetchRepresentatives(zip: searchText)
        } catch {
            print("Error fetching reps:", error)
        }
    }
}

#Preview {
    RepresentativeView()
}
