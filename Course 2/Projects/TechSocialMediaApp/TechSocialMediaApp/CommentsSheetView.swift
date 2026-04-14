//
//  CommentsSheetView.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/14/26.
//

import SwiftUI

struct CommentsSheetView: View {
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
                        Text(comment.authorName).bold()
                        Text(comment.text)
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
    CommentsSheetView(post: .constant(Post(author: .currentUser)))
}
