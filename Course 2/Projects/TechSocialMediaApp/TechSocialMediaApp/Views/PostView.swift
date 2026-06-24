//
//  PostView.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/13/26.
//

import SwiftUI

struct PostView: View {
    @Binding var post: Post
    @State private var showComments = false

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 3)
                .foregroundStyle(.gray)
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
                   

                Text(post.author.fullName)
                    .bold()
            }

            Text(post.title)
            Text(post.content)

            HStack {
                Button { post.toggleLike() } label: {
                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                        .foregroundStyle(post.isLiked ? .red : .black)
                }

                Text("\(post.likes)")

                Button { showComments = true } label: {
                    Image(systemName: "bubble")
                }

                Text("\(post.numberOfComments)")

                Spacer()

                Image(systemName: "arrowshape.turn.up.forward")
            }
            .padding(.vertical, 5)
        }
        .padding()
        .sheet(isPresented: $showComments) {
            CommentsSheetView(post: $post)
        }
    }
}

#Preview {
    PostView(post: .constant(Post(author: .currentUser)))
}
