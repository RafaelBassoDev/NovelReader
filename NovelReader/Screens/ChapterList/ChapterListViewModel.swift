//
//  ChapterListViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

class ChapterListViewModel {
    let chapters: [Chapter]
    
    var chapterCount: Int {
        chapters.count
    }
    
    init(chapters: [Chapter]) {
        self.chapters = chapters
    }
    
    func getChapter(at indexPath: IndexPath) -> Chapter {
        let index = indexPath.row
        return chapters[index]
    }
}
