//
//  TabsView.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/19/26.
//

import SwiftUI

struct TabsView: View {
    @Binding var isLoggedIn: Bool
    @State var creatingPost = false
    @Binding var posts: [Post]
    var body: some View {
        TabView {
            ProfilePage(isLoggedIn: $isLoggedIn, posts: $posts, viewModel: ProfilePageViewModel(user: User.currentUser, posts: [Post.currentUserPost]))
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            FeedView(posts: $posts)
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Timeline")
                }
               
        }
    }
}


