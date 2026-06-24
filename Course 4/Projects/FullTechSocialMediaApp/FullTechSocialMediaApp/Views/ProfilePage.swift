//
//  ProfilePage.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/11/26.
//

import SwiftUI

struct ProfilePage: View {
    @Binding var isLoggedIn: Bool
    @Binding var posts: [Post]
    @State var viewModel: ProfilePageViewModel
    @State private var newPost: Post = Post(author: User.currentUser, title: "", content: "", image: nil)
    @State private var editProfile = false
    @State private var showComments = false
    
    var body: some View {
            ScrollView {
                VStack (alignment: .leading, spacing: 50) {
                    Color(viewModel.user.backgroundCoverImage)
                        .frame(maxWidth: .infinity, minHeight: 150)
                        .overlay(
                            ZStack {
                                //Profile Image
                                Image(systemName: "app.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.white)
                                    .shadow(radius: 5)
                                    .overlay {
                                        Image(systemName: viewModel.user.profileImage)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                    .offset(y: 75)
                            }
                        )
                        .padding(.bottom, 15)
                    VStack(spacing: 10) {
                        Text(viewModel.user.fullName)
                            .font(.custom("Arial", size: 20))
                            .bold()
                        Text("@\(viewModel.user.userName)")
                        Text(viewModel.user.bio)
                        
                        Button {
                            editProfile = true
                        } label: {
                            Text("Edit Profile")
                        }
                        .buttonStyle(EditButtonStyle())
                        .padding(.horizontal, 20)
                        AddPost(post: $newPost){
                            posts.insert(newPost, at: 0)
                            newPost = Post(author: User.currentUser, title: "", content: "", image: nil)
                        }
                        SelectionToggle(posts: $posts)
                        
                        Button {
                            withAnimation(.snappy) {
                                isLoggedIn = false
                            }
                        } label: {
                            Text("LogOut")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .sheet(isPresented: $editProfile) {
                        EditProfileSheet(viewModel: $viewModel)
                    }
                    .sheet(isPresented: $showComments) {
                        CommentsSheet(post: $newPost)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }



