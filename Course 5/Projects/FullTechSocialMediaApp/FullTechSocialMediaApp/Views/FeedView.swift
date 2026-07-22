//
//  Timeline.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/24/26.
//

import SwiftUI

struct FeedView: View {
    @Environment(AppState.self) var appState
    @State private var didLoad = false
    
    var body: some View {
        ScrollView {
            
            if appState.isloadingFeed {
                ProgressView("loading feed...")
            }
            ForEach(appState.posts) { post in
                PostView(post: post)
            }
        }
        .onAppear {
            if !didLoad {
                Task {
                    await appState.loadFeed()
                }
                didLoad = true
            }
        }
    }
}



