//
//  EditPostSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/25/26.
//

import SwiftUI

struct EditPostSheet: View {
    let post: Post
    @Environment(AppState.self) var appState
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String
    @State private var content: String
    @State private var image: String?
    
    init(post: Post) {
        self.post = post
        _title = State(initialValue: post.title)
        _content = State(initialValue: post.content)
        _image = State(initialValue: post.image)
    }
    
    let icons = [
        "person.fill", "star.fill", "bolt.fill",
        "flame.fill", "shield.fill", "scope", "target",
        "crown.fill"
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $title)
                
                TextField("Content", text: $content, axis: .vertical)
                .lineLimit(5...10)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4),spacing: 12) {
                    ForEach(icons, id: \.self) { icon in
                        Image(systemName: "app.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(image == icon ? Color.blue : Color.white)
                            .shadow(radius: 5)
                            .overlay {
                                Image(systemName: icon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(image == icon ? Color.white : Color.black)
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3)) {
                                    image = icon
                                }
                            }
                    }
                }
                .padding(.vertical, 20)
                Button {
                    appState.updatePost(post, title: title, content: content, image: image)
                    dismiss()
                } label: {
                    Text("Save")
                }
                .buttonStyle(.borderedProminent)
                .buttonSizing(.flexible)
            }
            .padding()
            .navigationTitle("Edit Post")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


