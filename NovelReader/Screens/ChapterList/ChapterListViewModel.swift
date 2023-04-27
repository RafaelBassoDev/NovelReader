//
//  ChapterListViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

struct ChapterListViewModel {
    let chapters: [ChapterModel]
    
    init(chapters: [ChapterModel]) {
        self.chapters = chapters
    }
}

extension ChapterListViewModel {
    var chapterCount: Int {
        chapters.count
    }
    
    func getChapter(at indexPath: IndexPath) -> ChapterModel {
        let index = indexPath.row
        return chapters[index]
    }
}
