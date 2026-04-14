//
//  SwiftUIView.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 3/31/26.
//

import SwiftUI

struct ProfilePage: View {
    
    @State var viewModel: ProfilePageViewModel
    @State var post: Post = Post(author: .currentUser)
    @State private var editProfile = false
    @State private var showComments = false
    var body: some View {
        VStack (alignment: .leading, spacing: 50) {
            Image("iOSGlassBackground")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .overlay(
                    ZStack {
                        // White background circle
                        Circle()
                            .frame(width: 155)
                            .foregroundStyle(.white)
                            .offset(x: -100, y: 70)
                        
                        // Profile image
                        Image("\(viewModel.user.profileImage)")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(.circle)
                            .offset(x: -100, y: 70)
                        
                        // Camera button for profile image
                        cameraButton
                        .offset(x: -50, y: 125) // adjust position of profile image edit button
                        
                        // Camera button for cover image
                        cameraButton
                        .offset(x: 175, y: 70) // adjust position of cover image edit button
                    }
                )
            VStack (alignment: .leading) {
                HStack {
                    Text("\(viewModel.user.fullName)")
                        .font(.custom("Arial", size: 20))
                        .padding()
                        .bold()
                    Button {
                        editProfile = true
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(0)) // optional: makes it vertical like iOS
                            .padding()
                    }
                }
                Text("Username: \(viewModel.user.userName)")
                    .padding()
                TextField("Bio", text: $viewModel.user.bio, prompt: Text("Bio"))
                    .padding()
                HStack {
                    ForEach($viewModel.tags) { $tag in
                        Text(tag.name)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(tag.isSelected ? Color.green : Color.clear)
                            .cornerRadius(15)
                            .onTapGesture {
                                withAnimation {
                                    tag.isSelected.toggle() // Toggle selection
                                }
                            }
                    }
                }
                VStack (alignment: .leading) {
                    Text("Posts")
                        .bold()
                    HStack {
                        Image("\(viewModel.user.profileImage)")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(.circle)
                       Text("What's on your mind?")
                    }
                }
                
                .padding()
                // PostView
                Form {
                    Section {
                        VStack (alignment: .leading){
                            HStack {
                                Image("\(viewModel.user.profileImage)")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)
                                Text("\(post.author.firstName) \(post.author.lastName)")
                                    .bold()
                                    .padding(.vertical, 5)
                            }
                            Text("\(post.title)")
                            Text("\(post.content)")
                        }
                        HStack(spacing: 20) {
                            HStack {
                                Button(action: {
                                    post.toggleLike()
                                }) {
                                    Image(systemName: post.isLiked ? "heart.fill" : "heart")
                                        .foregroundStyle(post.isLiked ? .red : .black)
                                }
                                .buttonStyle(.borderless)
                                Text("\(post.likes)")
                            }
                            HStack {
                                Button {
                                    showComments = true
                                } label: {
                                    Image(systemName: "bubble")
                                }
                                Text("\(post.numberOfComments)")
                            }
                            Spacer()
                            Image(systemName: "arrowshape.turn.up.forward")
                        }
                    }
                }
                .font(.custom("Arial", size: 15))
                Spacer()
            }
            .sheet(isPresented: $editProfile) {
                EditProfileSheet(viewModel: $viewModel)
            }
            .sheet(isPresented: $showComments) {
                CommentsSheetView(post: $post)
            }
        }
    }
    var cameraButton: some View {
        ZStack {
            Circle()
                .frame(width: 40)
                .foregroundStyle(.white)
            Circle()
                .frame(width: 35)
                .foregroundStyle(.gray)
            
            Image(systemName: "camera.fill")
                .imageScale(.small)
                .foregroundStyle(.black)
                .font(.system(size: 18))
        }
    }
}




#Preview {
    ProfilePage(viewModel: ProfilePageViewModel())
}
