//
//  ProfilePageViewModel.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/17/26.
//

import Foundation

@Observable
class ProfilePageViewModel {
    var user: User
    var posts: [Post]

    
    init(user: User, posts: [Post]) {
        self.user = user
        self.posts = posts
    }
    
}


