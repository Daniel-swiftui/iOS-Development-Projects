//
//  UserModel.swift
//  TechSocialMediaApp
//
//  Created by Daniel Umpierrez on 3/31/26.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    var firstName: String
    var lastName: String
    var userName: String
    var bio: String
    var techinterest: InterestTag = InterestTag(name: "Ai")
    var profileImage: String
    var backgroundCoverImage: String
    
    var fullName: String { "\(firstName) \(lastName)"}
}

struct InterestTag: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

extension User {
    static let currentUser = User(firstName: "Daniel", lastName: "Umpierrez", userName: "GamerBonez", bio: "bio", profileImage: "Daniel", backgroundCoverImage: "iOSGlassBackground")
    
    static let otherUser = User(firstName: "Other", lastName: "User", userName: "OtherUser", bio: "bio", profileImage: "otherProfile", backgroundCoverImage: "otherCover")
}
