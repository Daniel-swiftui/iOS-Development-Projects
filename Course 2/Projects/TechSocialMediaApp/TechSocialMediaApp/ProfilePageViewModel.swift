//
//  ProfilePageViewModel.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 3/31/26.
//

import Foundation

@Observable
class ProfilePageViewModel {

    var user: User = User.currentUser

    var tags = [
        InterestTag(name: "Swift"),
        InterestTag(name: "SwiftUI"),
        InterestTag(name: "iOS")
    ]

    var posts: [Post] = [
        Post(author: .currentUser),
        Post(author: .otherUser)
    ]
}
