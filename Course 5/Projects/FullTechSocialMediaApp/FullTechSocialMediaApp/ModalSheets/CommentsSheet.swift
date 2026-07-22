//
//  CommentsSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/18/26.
//

import SwiftUI

struct CommentsSheet: View {
    let post: Post
    @Environment(AppState.self) var appState
    @Environment(\.dismiss) var dismiss
    @State private var newComment: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Comments")
                Spacer()
                Button("Done") { dismiss() }
            }
            .padding()
            
            List {
                ForEach(post.comments) { comment in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "app.fill")
                                .resizable()
                                .frame(width:40, height: 40)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                                .overlay {
                                    Image(systemName:post.author.profileImage)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                            
                            Text(comment.authorName)
                        }
                            .bold()
                        Text(comment.text)
                            .padding(.horizontal, 5)
                        
                    }
                }
            }
            
            HStack {
                TextField("Add comment...", text: $newComment)
                
                Button("Post") {
                    appState.addComment(to: post, text: newComment)
                    newComment = ""
                }
            }
            .padding()
        }
    }
}


