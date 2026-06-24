//
//  FullTechSocialMediaAppApp.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/10/26.
//

import SwiftUI

@main
struct FullTechSocialMediaAppApp: App {
    @State private var isLoggedIn = false
    @State private var posts: [Post] = []
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isLoggedIn {
                   TabsView(isLoggedIn: $isLoggedIn, posts: $posts)
                    .transition(.push(from: .leading).combined(with: .opacity))
                } else {
                    LoginScreen(isLoggedIn: $isLoggedIn)
                        .transition(.push(from: .leading).combined(with: .opacity))
                }
            }
            .animation(.easeInOut(duration: 0.5), value: isLoggedIn)
        }
    }
}
