//
//  AddPostImageSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/23/26.
//

import SwiftUI

struct AddPostImageSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var post: Post

    let icons = [
        "person.fill", "star.fill", "bolt.fill",
        "flame.fill", "shield.fill", "scope", "target",
        "crown.fill"
    ]
    var body: some View {
        VStack {
            Text("Select an Image")
                .font(.headline)
                .bold()
                .padding()
            Spacer()
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4),spacing: 12) {
                ForEach(icons, id: \.self) { icon in
                    Image(systemName: "app.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(post.image == icon ? Color.blue : Color.white)
                        .shadow(radius: 5)
                        .overlay {
                            Image(systemName: icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(post.image == icon ? Color.white : Color.black)
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3)) {
                                post.image = icon
                            }
                        }
                }
            }
            .padding()
            Button {
                dismiss()
            }label: {
                Text("Done")
            }
            .buttonStyle(LoginButtonStyle())
            .padding()
            Spacer()
        }
    }
}


