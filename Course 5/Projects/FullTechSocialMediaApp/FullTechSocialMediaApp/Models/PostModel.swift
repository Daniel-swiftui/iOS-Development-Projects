//
//  Untitled.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/17/26.
//

import SwiftUI
import Foundation

struct Post: Identifiable, Hashable {
    let id: UUID
    var author: User
    var title: String
    var content: String
    var image: String?
    var likes: Int = 0
    var isLiked: Bool = false
    var comments: [Comment] = []
    let postedDate: Date
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
    
    private let postDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}

extension Post {
    static let currentUserPost = Post(id: UUID(), author: User.currentUser, title: "currentUser Title", content: "currentUser Content", postedDate: Date())
}

extension Post {

    init(dto: PostResponseDTO, author: User) {
        self.id = dto.postID
        self.author = author
        self.title = dto.title
        self.content = dto.body
        self.image = nil
        self.likes = dto.likes
        self.isLiked = dto.userLiked
        self.comments = []
        self.postedDate = dto.createdDate
    }
}
