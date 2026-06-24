//
//  Untitled.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/17/26.
//

import SwiftUI
import Foundation

struct Post: Identifiable, Hashable {
    let id: UUID = UUID()
    var author: User
    var title: String
    var content: String
    var image: String?
    var likes: Int = 0
    var isLiked: Bool = false
    var comments: [Comment] = []
    
    var numberOfComments: Int {
        comments.count
    }
    
    mutating func toggleLike() {
        isLiked.toggle()

        if isLiked {
            likes += 1
        } else {
            likes = max(0, likes - 1)
        }
    }
}

extension Post {
    static let currentUserPost = Post(author: User.currentUser, title: "currentUser Title", content: "currentUser Content")
}
