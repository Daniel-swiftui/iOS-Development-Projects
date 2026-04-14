//
//  PostModel.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/2/26.
//
import Foundation

struct Post: Identifiable {
    let id = UUID()
    var author: User
    var title: String = "This post"
    var content: String = "This is my post"
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

