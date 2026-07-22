//
//  PostView.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/17/26.
//

import SwiftUI

struct PostView: View {
    @Environment(AppState.self) var appState
    let post: Post
    @State private var showEditSheet = false
    @State private var showComments = false
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack {
                Image(systemName: "app.fill")
                    .resizable()
                    .frame(width:40, height: 40)
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
                    .overlay {
                        Image(systemName: post.author.profileImage)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                
                
                Text(post.author.userName)
                    .bold()
                Spacer()
                Menu {
                    Button {
                        showEditSheet = true
                    } label: {
                        Label("Edit Post", systemImage: "pencil")
                    }
                    
                    Button(role: .destructive) {
                        appState.deletePost(post)
                    } label: {
                        Label("Delete Post", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            if let imageName = post.image {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture(count: 2) {
                        if !post.isLiked {
                            appState.toggleLike(post)
                        }
                    }
            }
            Text(post.title)
            Text(post.content)
            
            HStack {
                Button {
                    appState.toggleLike(post)
                } label: {
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
            Text(post.postedDate, style: .relative)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .sheet(isPresented: $showEditSheet) {
            EditPostSheet(post: post)
        }
        .sheet(isPresented: $showComments) {
            CommentsSheet(post: post)
        }
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 3)
            .foregroundStyle(.gray)
            .padding()
    }
}


#Preview {
    let appState = AppState()
    
    appState.currentUser = .currentUser
    appState.posts = [
        Post(
            id: UUID(),
            author: .currentUser,
            title: "Learning SwiftUI",
            content: "This is a sample post for the preview.",
            image: "swift",
            postedDate: Date()
        )
    ]
    
    return PostView(post: appState.posts[0])
        .environment(appState)
}
