//
//  CommentsSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/18/26.
//

import SwiftUI

struct CommentsSheet: View {
    @Binding var post: Post
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
                    addComment()
                }
            }
            .padding()
        }
    }
    
    private func addComment() {
        let trimmed = newComment.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        post.comments.append(
            Comment(authorName: post.author.firstName, text: trimmed)
        )
        
        newComment = ""
    }
}

#Preview {
    CommentsSheet(post: .constant(Post.currentUserPost))
}
