//
//  CommentModel.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/17/26.
//

import Foundation

struct Comment: Identifiable, Hashable {
    let id: UUID = UUID()
    var authorName: String
    var text: String
}
