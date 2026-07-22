//
//  CreatePostRequestDTO.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/30/26.
//

import Foundation

struct CreatePostRequestDTO: Codable {
    let post: PostBody

    struct PostBody: Codable {
        let title: String
        let body: String
    }
}
