//
//  DataTransferObjects.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/24/26.
//

import Foundation

struct SignInResponseDTO: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let userUUID: UUID
    let secret: UUID
    let userName: String
}

struct UserProfileResponseDTO: Codable {
    let firstName: String
    let lastName: String
    let userName: String
    let userUUID: UUID
    let bio: String?
    let techInterests: String?
    let posts: [PostResponseDTO]
}

struct PostResponseDTO: Codable {
    let postID: UUID
    let title: String
    let body: String
    let authorUserName: String
    let authorUserId: UUID
    let likes: Int
    let userLiked: Bool
    let numComments: Int
    let createdDate: Date
}

struct CommentResponseDTO: Codable {
    let commentId: UUID
    let body: String
    let userName: String
    let userId: UUID
    let createdDate: Date
}

struct SignInRequestDTO: Codable {
    let email: String
    let password: String
}
