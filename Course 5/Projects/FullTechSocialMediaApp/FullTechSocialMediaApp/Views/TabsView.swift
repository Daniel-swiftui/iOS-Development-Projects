//
//  TabsView.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/19/26.
//

import SwiftUI

struct TabsView: View {
    @State var creatingPost = false
    var body: some View {
        TabView {
            ProfilePage()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Timeline")
                }
               
        }
    }
}


