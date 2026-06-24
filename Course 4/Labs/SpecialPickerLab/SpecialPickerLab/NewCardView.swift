//
//  ContentView.swift
//  SpecialPickerLab
//
//  Created by Daniel Umpierrez on 5/18/26.
//

import SwiftUI
import PhotosUI

struct NewCardView: View {
    @State private var card: Card = Card(date: Date(), backgroundColor: .white)
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("Description") {
                        TextEditor(text: $card.description)
                    }
                    Section("Date") {
                        DatePicker("Select Date", selection: $card.date, displayedComponents: .date)
                    }
                    Section("Background Color") {
                        ColorPicker("Choose Background Color", selection: $card.backgroundColor)
                    }
                    Section("Add Photo") {
                        PhotosPicker("Add Photo", selection: $card.photoItem)
                            .onChange(of: card.photoItem) {
                                oldValue, newValue in
                                handleSinglePhotoChange(newValue)
                            }
                        if let image = card.photoImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        }
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    if let image = card.photoImage {
                        NavigationLink("Save") {
                            CreatedCardView(
                                backgroundColor: card.backgroundColor,
                                description: card.description,
                                date: card.date,
                                image: image
                            )
                        }
                    } else {
                        Text("Save")
                            .foregroundStyle(.gray)
                    }
                }
            }
            .navigationTitle("Create New Card")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func handleSinglePhotoChange(_ newValue: PhotosPickerItem?) {
        Task {
            if let newValue {

                if let data = try? await newValue.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {

                    card.photoImage = uiImage
                    card.photoItem = newValue
                }

            } else {
                card.photoImage = nil
                card.photoItem = nil
            }
        }
    }
}

#Preview {
    NewCardView()
}
