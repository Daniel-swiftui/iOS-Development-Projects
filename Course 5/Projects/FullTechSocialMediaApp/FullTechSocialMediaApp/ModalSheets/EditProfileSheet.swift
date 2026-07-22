//
//  EditProfileSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/17/26.
//

import SwiftUI

struct EditProfileSheet: View {
    @Environment(AppState.self) var appState
    @Environment(\.dismiss) var dismiss
    @State private var isEditingProfileImage = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Edit Profile")
                .bold()
                .padding(.vertical,30)
            Button {
                //This should pull up a modal sheet with SF symbols to choose from
                isEditingProfileImage = true
            } label: {
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
            }
            .padding(.bottom, 10)
            
            ColorPicker(
                "Profile Background Color",
                selection: Binding(get: {appState.currentUser.backgroundCoverImage}, set: {appState.currentUser.backgroundCoverImage = $0})
            )
            .padding()
            
            TextField("First Name", text: Binding(get: { appState.currentUser.firstName }, set: {appState.currentUser.firstName = $0} ) )
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: Binding(get: { appState.currentUser.lastName }, set: {appState.currentUser.lastName = $0} ) )
                .textFieldStyle(.roundedBorder)
            TextField("Username", text: Binding(get: { appState.currentUser.userName }, set: {appState.currentUser.userName = $0} ) )
                .textFieldStyle(.roundedBorder)
            TextField("Bio", text: Binding(get: { appState.currentUser.bio }, set: {appState.currentUser.bio = $0} ) )
                .textFieldStyle(.roundedBorder)
            
            Button("Save") {
                dismiss()
                
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .tint(.pink)
            .bold()
        }
        .font(.custom("Arial", size: 20))
        .padding()
        .sheet(isPresented: $isEditingProfileImage) {
            EditProfileImageSheet()
        }
    }
}
