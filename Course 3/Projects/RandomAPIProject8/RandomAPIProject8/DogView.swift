//
//  DogView.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/20/26.
//

import SwiftUI

struct DogView: View {
    @State private var dogName: String = ""
    @State private var dog: Dog?
    @State private var savedDogs: [Dog] = []
    @State private var isLoading = false
    @State private var hasLoaded = false
    
    let api = DogAPIController()
    
    var body: some View {
        NavigationStack {
            VStack {
                //This is where the image from the API will go
                dogImage
                //This is where you name the dog
                TextField("Name", text: $dogName, prompt: Text("Name?"))
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
                    //This button should add the dog to a list and generate a new dog
                    Task {
                        if var currentDog = dog {
                            currentDog.name = dogName
                            savedDogs.append(currentDog)
                        }
                        await fetchNewDog()
                    }
                } label: {
                    Text("Save and Generate New")
                }
                .buttonStyle(.borderedProminent)
                .buttonSizing(.flexible)
                .padding()
                .disabled(dogName.isEmpty)
                
                List($savedDogs) { $dog in
                    NavigationLink {
                        EditDogView(dog: $dog)
                    } label: {
                        DogListCell(dog: dog)
                    }
                }
            }
            .task {
                guard !hasLoaded else { return }
                hasLoaded = true
                await fetchNewDog() // load first dog on appear
            }
            
        }
    }
    
    func fetchNewDog() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            dog = try await api.fetchImage()
            dogName = "" // reset name for next dog
        } catch {
            print("Error fetching dog:", error)
        }
    }
    var dogImage: some View {
        VStack {
            if let imageUrlString = dog?.message,
               let url = URL(string: imageUrlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 300)
                            .clipped()
                    case .failure:
                        Image(systemName: "xmark.octagon")
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "dog.fill")
                    .resizable()
                    .frame(width: 250, height: 300)
                    .border(.blue)
            }
        }
    }
}


#Preview {
    DogView()
}
