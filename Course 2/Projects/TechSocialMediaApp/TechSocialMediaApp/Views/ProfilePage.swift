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
                    HStack {
                        ForEach($viewModel.tags) { $tag in
                            Text(tag.name)
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
                    Button {
                        editProfile = true
                    } label: {
                        Text("Edit Profile")
                    }
                    .buttonStyle(EditButtonStyle())
                    .padding(.horizontal, 20)
                    
                    VStack {
                        Text("Posts")
                            .bold()
                    }
                    
                    // PostView
                    VStack {
                        PostView(post: .constant(Post(author: .currentUser)))
                    }
                }
                .sheet(isPresented: $editProfile) {
                    EditProfileSheet(viewModel: $viewModel)
                }
                .sheet(isPresented: $showComments) {
                    CommentsSheetView(post: $post)
                }
            }
        }
        .ignoresSafeArea()
    }
}




#Preview {
    ProfilePage(viewModel: ProfilePageViewModel())
}
