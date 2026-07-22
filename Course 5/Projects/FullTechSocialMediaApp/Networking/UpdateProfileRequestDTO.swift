//
//  UpdateProfileRequestDTO.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 7/7/26.
//

import Foundation

struct UpdateProfileRequestDTO: Codable {
    let profile: Profile

    struct Profile: Codable {
        let userName: String
        let bio: String?
        let techInterests: String?
    }
}
