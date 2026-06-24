//
//  Timeline.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/24/26.
//

import SwiftUI

struct FeedView: View {
    @Binding var posts: [Post]
   
    var body: some View {
        ScrollView {
            VStack {
                ForEach($posts) { $post in
                    PostView(post: $post)
                }
            }
        }
    }
}


