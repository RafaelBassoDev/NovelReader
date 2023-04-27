//
//  ReadingViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import Foundation

struct ReadingViewModel {
    private let chapter: ChapterModel
    
    init(chapter: ChapterModel) {
        self.chapter = chapter
    }
}

extension ReadingViewModel {
    var title: String {
        chapter.title
    }
    
    var content: String {
        chapter.content
    }
}
