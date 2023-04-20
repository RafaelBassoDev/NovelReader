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
    
    private let storage: NovelStorable
    
    init(storage: NovelStorable) {
        let dataSource = [
            Novel(
                title: "A Will Eternal",
                chapters: [
                    Chapter(
                        title: "Chapter 01",
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum tincidunt turpis,et mattis purus elementum eget. Fusce tincidunt ultric."
                    ),
                    Chapter(title: "Chapter 02", content: "some text"),
                    Chapter(title: "Chapter 03", content: "some text"),
                    Chapter(title: "Chapter 04", content: "some text")
                ]
            ),
            Novel(
                title: "Immortal renegade",
                chapters: [
                    Chapter(title: "Chapter 01", content: "some text")
                ]
            ),
            Novel(
                title: "I Shal Seal The Heavens",
                chapters: [
                    Chapter(title: "Chapter 01", content: "some text")
                ]
            )
        ]
        self.storage = storage
        self.novels = dataSource
    }
}

extension NovelRepository {
    func setCurrentNovel(_ novel: Novel) {
        self.currentNovel = novel
    }
    
    func setCurrentChapter(_ chapter: Chapter) {
        self.currentChapter = chapter
    }
    
    func getNextChapter() -> Chapter? {
        guard let chapter = searchNextChapter() else {
            return nil
        }
        setCurrentChapter(chapter)
        return chapter
    }
    
    func getPreviousChapter() -> Chapter? {
        guard let chapter = searchPreviousChapter() else {
            return nil
        }
        setCurrentChapter(chapter)
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
    
    private func searchPreviousChapter() -> Chapter? {
        return nil
    }
}
