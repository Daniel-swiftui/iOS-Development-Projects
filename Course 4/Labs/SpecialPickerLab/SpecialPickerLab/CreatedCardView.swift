//
//  CreatedCardView.swift
//  SpecialPickerLab
//
//  Created by Daniel Umpierrez on 5/18/26.
//

import SwiftUI

struct CreatedCardView: View {
    @State var backgroundColor: Color
    @State var description: String
    @State var date: Date
    @State var image: UIImage
    var body: some View {
        NavigationStack {
            ZStack {
                Color(backgroundColor)
                    .ignoresSafeArea()
                VStack {
                    
                    Text(description)
                    
                    Text(date.formatted())
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 350, height: 350)
                }
                .font(.custom("futura", size: 25))
                .navigationTitle("Created Card")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    CreatedCardView(
        backgroundColor: .blue,
        description: "Sample Card",
        date: Date(),
        image: UIImage(systemName: "star.fill")!
    )
}
