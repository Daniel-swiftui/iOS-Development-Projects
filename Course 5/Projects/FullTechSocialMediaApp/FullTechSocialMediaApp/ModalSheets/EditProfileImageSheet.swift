//
//  EditProfilePictureSheet.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/18/26.
//

import SwiftUI
import Foundation

struct EditProfileImageSheet: View {
    @Environment(AppState.self) var appState
    @Environment(\.dismiss) private var dismiss

    let icons = [
        "person.fill", "star.fill", "bolt.fill",
        "flame.fill", "shield.fill", "scope", "target",
        "crown.fill"
    ]
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4),spacing: 12) {
                ForEach(icons, id: \.self) { icon in
                    Image(systemName: "app.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(appState.currentUser.profileImage == icon ? Color.blue : Color.white)
                        .shadow(radius: 5)
                        .overlay {
                            Image(systemName: icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(appState.currentUser.profileImage == icon ? Color.white : Color.black)
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3)) {
                                appState.currentUser.profileImage = icon
                            }
                        }
                }
            }
            .padding()
            Button {
                dismiss()
            }label: {
                Text("Save")
            }
            .buttonStyle(LoginButtonStyle())
            .padding()
        }
    }
}

