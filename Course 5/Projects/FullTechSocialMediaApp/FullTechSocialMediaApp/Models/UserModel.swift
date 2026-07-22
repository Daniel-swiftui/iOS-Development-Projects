//
//  UserModel.swift
//  FullTechSocialMediaApp
//
//  Created by Daniel Umpierrez on 6/11/26.
//

import Foundation
import SwiftUI

struct User: Identifiable, Hashable {
    let id: UUID
    var firstName: String
    var lastName: String
    var userName: String
    var bio: String
    var profileImage: String
    var backgroundCoverImage: Color
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
}

extension User {
    static let currentUser =  User(id: UUID(), firstName: "Daniel", lastName: "Umpierrez", userName: "GamerBonez", bio: "I like SwiftUI", profileImage: "person.fill", backgroundCoverImage: .blue)
    
    static let otherUser = User(id: UUID(), firstName: "Other", lastName: "User", userName: "OtherUser", bio: "bio", profileImage: "star.fill", backgroundCoverImage: .red)
}
