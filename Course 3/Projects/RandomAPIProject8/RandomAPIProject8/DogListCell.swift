//
//  DogListView.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/21/26.
//

import SwiftUI

struct DogListCell: View {
    let dog: Dog
    var body: some View {
        HStack {
            //This should be the named dogs picture
            dogImage
            //This should display the name given
            Text(dog.name ?? "Unnamed Dog")
            Spacer()
//            Image(systemName: "chevron.forward")
                .bold()
        }
    }
    var dogImage: some View  {
        VStack {
            if let url = URL(string: dog.message) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                        .cornerRadius(6)
                                case .failure:
                                    Image(systemName: "dog.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
        }
    }
}


#Preview {
    DogListCell(dog: Dog(
            message: "https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg",
            status: "success", name: "Buddy"
        ))
}
