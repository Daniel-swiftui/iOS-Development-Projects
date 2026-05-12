//
//  Representative.swift
//  RandomAPIProject8
//
//  Created by Daniel Umpierrez on 4/23/26.
//

import Foundation

struct Representative: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var party: String
    var state: String
    var phone: String
    var office: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case name, party, state, phone , office, link
    }
}
