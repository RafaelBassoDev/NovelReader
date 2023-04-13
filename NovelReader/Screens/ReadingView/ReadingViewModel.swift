//
//  ReadingViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import Foundation

class ReadingViewModel {
    
    private let chapter: Chapter
    
    var title: String {
        chapter.title
    }
    
    var content: String {
        chapter.content
    }
    
    init(chapter: Chapter) {
        self.chapter = chapter
    }
    
}
