//
//  Chapter.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import Foundation

struct Chapter {
    let number: Int
    let title: String
    let subtitle: String?
    let content: String
    
    init(number: Int, title: String, subtitle: String? = nil, content: String = "") {
        self.number = number
        self.title = title
        self.subtitle = subtitle
        self.content = content
    }
}

extension Chapter {
    func withContent(_ newContent: String) -> Self {
        return Chapter(number: number, title: title, subtitle: subtitle, content: newContent)
    }
}

extension Chapter: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.number == rhs.number
    }
}
