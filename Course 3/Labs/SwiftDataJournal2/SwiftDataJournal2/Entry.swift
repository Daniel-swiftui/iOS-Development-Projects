//
//  Entry.swift
//  SwiftDataJournal2
//
//  Created by Daniel Umpierrez on 4/27/26.
//
import Foundation
import SwiftData

@Model
class Entry {
    var id: UUID
    var title: String
    var body: String
    var createdAt: Date
    var updatedAt: Date

    var journal: Journal?

    init(title: String, body: String, journal: Journal? = nil) {
        self.id = UUID()
        self.title = title
        self.body = body
        self.createdAt = Date()
        self.updatedAt = Date()
        self.journal = journal
    }
}
