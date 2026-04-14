//
//  TabView.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/13/26.
//

import SwiftUI

struct TabsView: View {
    
    var body: some View {
        TabView {
            ProfilePage(viewModel: ProfilePageViewModel())
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            TimelineView(posts: [
                Post(author: .currentUser),
                Post(author: .otherUser)
            ])
            .tabItem {
                Image(systemName: "house")
                Text("Timeline")
            }
        }
    }
}
#Preview {
    TabsView()
}
