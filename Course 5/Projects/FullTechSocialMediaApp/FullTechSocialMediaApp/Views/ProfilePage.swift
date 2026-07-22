//
//  ProfilePage.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/11/26.
//

import SwiftUI

struct ProfilePage: View {
    @Environment(AppState.self) var appState
    @State private var newPost: Post = Post(id: UUID(), author: User.currentUser, title: "", content: "", image: nil, postedDate: Date())
    @State private var editProfile = false
    @State private var showComments = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 50) {
                Color(appState.currentUser.backgroundCoverImage)
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
                                    Image(systemName: appState.currentUser.profileImage)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                .offset(y: 75)
                        }
                    )
                    .padding(.bottom, 15)
                VStack(spacing: 10) {
                    Text(appState.currentUser.fullName)
                        .font(.custom("Arial", size: 20))
                        .bold()
                    Text("@\(appState.currentUser.userName)")
                    Text(appState.currentUser.bio)
                    
                    Button {
                        editProfile = true
                    } label: {
                        Text("Edit Profile")
                    }
                    .buttonStyle(EditButtonStyle())
                    .padding(.horizontal, 20)
                    AddPost()
                    SelectionToggle()
                    
                    Button {
                        withAnimation(.snappy) {
                            appState.logout()
                        }
                    } label: {
                        Text("LogOut")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .sheet(isPresented: $editProfile) {
                EditProfileSheet()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}



#Preview {
    let appState = AppState()
    
    ProfilePage()
        .environment(appState)
}
