//
//  Chapter.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import Foundation

struct Chapter: Identifiable, Equatable {
    var id: UUID
    let title: String
    let subtitle: String?
    let content: String

    init(title: String, subtitle: String? = nil, content: String) {
        self.id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.content = content
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
