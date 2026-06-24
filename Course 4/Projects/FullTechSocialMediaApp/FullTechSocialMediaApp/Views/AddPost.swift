//
//  AddPostSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/19/26.
//

import SwiftUI

struct AddPost: View {
    @Binding var post: Post
    let onPost: () -> Void

    @State private var selectingImage = false
    
    var body: some View {
        VStack {
            Text("Post")
                .font(.headline)
            HStack {
                VStack {
                    TextField("Title", text: $post.title)
                        .textFieldStyle(.roundedBorder)
                    TextField("Post", text: $post.content)
                        .textFieldStyle(.roundedBorder)
                }
                Button {
                    selectingImage = true
                } label: {
                    Image(systemName: "camera.fill")
                        .frame(height: 60)
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(Color.white)
            }
            .padding(.horizontal, 20)
            
            Button {
                onPost()
            } label: {
                Image(systemName: "paperplane.fill")
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .foregroundStyle(Color.white)
            .padding(.horizontal, 20)
        }
        .sheet(isPresented: $selectingImage) {
            AddPostImageSheet(post: $post)
        }
    }
}


