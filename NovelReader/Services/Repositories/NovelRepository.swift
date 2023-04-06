//
//  NovelRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

class NovelRepository: NovelRepositoreable {
    private(set) var novels: [Novel]
    private(set) var currentNovel: Novel?
    private(set) var currentChapter: Chapter?
    
    var currentChapterIndex: Int? {
        guard let novelChapters = currentNovel?.chapters, let currentChapter else { return nil }
        if novelChapters.isEmpty {
            return nil
        }
        return novelChapters.firstIndex(of: currentChapter)
    }
    
    init(novels: [Novel]) {
        self.novels = novels
    }
}

extension NovelRepository {
    func setCurrentNovel(_ novel: Novel) {
        self.currentNovel = novel
    }
    
    func getNextChapter() -> Chapter? {
        let chapter = searchNextChapter()
        if chapter != nil {
            self.currentChapter = chapter
        }
        return chapter
    }
    
    private func searchNextChapter() -> Chapter? {
        guard let currentNovelChapters = currentNovel?.chapters else { return nil }
        guard let currentChapterIndex else { return nil }
        
        let lastChapterIndex = currentNovelChapters.count - 1
        
        guard currentChapterIndex < lastChapterIndex else { return nil }
        
        let nextChapterIndex = currentChapterIndex + 1
        
        return currentNovelChapters[nextChapterIndex]
    }
}
