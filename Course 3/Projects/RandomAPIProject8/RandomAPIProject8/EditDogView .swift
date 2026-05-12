//
//  EditDogView .swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/21/26.
//

import SwiftUI

struct EditDogView: View {
    @Binding var dog: Dog
    
    var body: some View {
        VStack(spacing: 20) {
            
            if let url = URL(string: dog.message) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350)
                        .border(.blue)
                } placeholder: {
                    ProgressView()
                }
            }
            
            TextField("Dog Name", text: Binding(
                get: { dog.name ?? "" },
                set: { dog.name = $0 }
            ))
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Spacer()
        }
        .navigationTitle("Edit Dog")
        .padding()
    }
}

#Preview {
    EditDogView(dog: .constant(Dog(
        message: "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg",
        status: "success", name: "Buddy"
    )))
}
