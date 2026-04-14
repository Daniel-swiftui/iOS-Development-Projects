//
//  EditProfileSheet.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/14/26.
//


import SwiftUI

struct EditProfileSheet: View {
    @Binding var viewModel: ProfilePageViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Edit Profile")
                .bold()
                .padding(.vertical,30)
            TextField("First Name", text: $viewModel.user.firstName, prompt: Text("First Name"))
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $viewModel.user.lastName, prompt: Text("Last Name"))
                .textFieldStyle(.roundedBorder)
            TextField("User Name", text: $viewModel.user.userName, prompt: Text("User Name"))
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
    }
}