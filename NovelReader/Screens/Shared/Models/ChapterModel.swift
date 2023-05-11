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
