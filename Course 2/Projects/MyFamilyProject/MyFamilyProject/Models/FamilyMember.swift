//
//  FamilyMember.swift
//  MyFamilyProject
//
//  Created by Daniel Umpierrez on 3/4/26.
//

import Foundation

struct FamilyMember: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: Int
    var favoriteColor: String
    var favoriteFood: String
    var familyRelation: String
    var viewed: Bool 
    var profileImage: String
}

extension FamilyMember {
    static var memberDetails: [FamilyMember] = [
        FamilyMember(name: "Daniel", age: 29, favoriteColor: "Black", favoriteFood: "Pizza", familyRelation: "" ,viewed: false, profileImage: "Daniel"),
        FamilyMember(name: "Andrea", age: 30, favoriteColor: "Purple", favoriteFood: "Pollo Con Tajadas",familyRelation: "Wife", viewed: false, profileImage: "Andrea"),
        FamilyMember(name: "David", age: 28, favoriteColor: "Blue", favoriteFood: "Chicken Tenders", familyRelation: "Brother", viewed: false, profileImage: "David"),
        FamilyMember(name: "Emma", age: 19, favoriteColor: "Sage Green", favoriteFood: "Soup", familyRelation: "Sister", viewed: false, profileImage: "Emma"),
        FamilyMember(name: "Amy", age: 16, favoriteColor: "TDB", favoriteFood: "Pasta", familyRelation: "Sister", viewed: false, profileImage: "Amy")
    ]
}


