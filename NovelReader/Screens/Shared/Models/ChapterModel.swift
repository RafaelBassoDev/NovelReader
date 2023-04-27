//
//  Chapter.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import Foundation

struct ChapterModel {
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

extension ChapterModel {
    func withContent(_ newContent: String) -> Self {
        return ChapterModel(number: number, title: title, subtitle: subtitle, content: newContent)
    }
}

extension ChapterModel: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.number == rhs.number
    }
}
