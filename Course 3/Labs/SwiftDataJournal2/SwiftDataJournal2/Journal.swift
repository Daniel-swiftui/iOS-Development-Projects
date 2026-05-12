//
//  Journal.swift
//  SwiftDataJournal2
//
//  Created by Daniel Umpierrez on 4/28/26.
//
import Foundation
import SwiftData

@Model
class Journal {
    var id: UUID
    var title: String
    var createdAt: Date
    var updatedAt: Date

    @Relationship(deleteRule: .cascade, inverse: \Entry.journal)
    var entries: [Entry]

    init(title: String) {
        self.id = UUID()
        self.title = title
        self.createdAt = Date()
        self.updatedAt = Date()
        self.entries = []
    }

    var entryCount: Int {
        entries.count
    }
}

