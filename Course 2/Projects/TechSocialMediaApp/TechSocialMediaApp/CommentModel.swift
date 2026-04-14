//
//  CommentModel.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 4/2/26.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    var authorName: String
    var text: String
}

