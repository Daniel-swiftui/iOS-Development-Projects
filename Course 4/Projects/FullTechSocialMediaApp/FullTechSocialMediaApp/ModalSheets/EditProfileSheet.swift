//
//  EditProfileSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/17/26.
//

import SwiftUI

struct EditProfileSheet: View {
    @Binding var viewModel: ProfilePageViewModel
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
                        Image(systemName: viewModel.user.profileImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
            }
            .padding(.bottom, 10)
            TextField("First Name", text: $viewModel.user.firstName, prompt: Text("First Name"))
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $viewModel.user.lastName, prompt: Text("Last Name"))
                .textFieldStyle(.roundedBorder)
            TextField("Username", text: $viewModel.user.userName, prompt: Text("Username"))
                .textFieldStyle(.roundedBorder)
            TextField("Bio", text: $viewModel.user.bio, prompt: Text("Bio"))
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
            EditProfileImageSheet(viewModel: $viewModel)
        }
    }
}

