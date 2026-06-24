//
//  TimelineView.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/13/26.
//

import SwiftUI


struct TimelineView: View {
    @State private var posts: [Post]

    init(posts: [Post]) {
        self._posts = State(initialValue: posts)
    }

    var body: some View {
        ScrollView {
            VStack {
                ForEach($posts) { $post in
                    PostView(post: $post)
                        .padding(.vertical, 8)
                }
            }
        }
    }
}

#Preview {
    TimelineView(posts: [
        Post(author: .currentUser),
        Post(author: .otherUser)
    ])
}
