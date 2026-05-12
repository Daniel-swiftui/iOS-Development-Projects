//
//  DogListView.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/22/26.
//

import SwiftUI

struct DogListView: View {
    @Binding var dogs: [Dog]
    
    var body: some View {
        NavigationStack {
            List($dogs) { $dog in
                NavigationLink {
                    EditDogView(dog: $dog)
                } label: {
                    DogListCell(dog: dog)
                }
            }
            .navigationTitle("Saved Dogs")
        }
    }
}

#Preview {
    DogListView(dogs: .constant([
        Dog(message: "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg", status: "success", name: "Buddy"),
        Dog(message: "https://images.dog.ceo/breeds/retriever-golden/n02099601_3004.jpg", status: "success", name: "Max")
    ]))
}
