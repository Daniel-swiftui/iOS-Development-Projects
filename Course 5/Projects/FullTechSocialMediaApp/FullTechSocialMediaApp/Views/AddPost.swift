//
//  AddPostSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/19/26.
//

import SwiftUI

struct AddPost: View {
    @Environment(AppState.self) var appState
    @State private var title = ""
    @State private var content = ""
    @State private var image: String? = nil
    @State private var selectingImage = false
    
    var body: some View {
        VStack {
            Text("Post")
                .font(.headline)
            HStack {
                VStack {
                    TextField("Title", text: $title)
                        .textFieldStyle(.roundedBorder)
                    TextField("Post", text: $content)
                        .textFieldStyle(.roundedBorder)
                }
                Button {
                    selectingImage = true
                } label: {
                    Image(systemName: "camera.fill")
                        .frame(height: 60)
                }
                .buttonStyle(AddImageButtonStyle())
                .foregroundStyle(Color.white)
            }
            .padding(.horizontal, 20)
            
            Button {
                Task {
                    await appState.addPost(title: title, content: content, image: image)
                    title = ""
                    content = ""
                    image = nil
                }
            } label: {
                Image(systemName: "paperplane.fill")
            }
            .buttonStyle(PostButtonStyle())
            .buttonSizing(.flexible)
            .foregroundStyle(Color.white)
            .padding(.horizontal, 20)
        }
        .sheet(isPresented: $selectingImage) {
            AddPostImageSheet(selectedImage: $image)
        }
    }
}


