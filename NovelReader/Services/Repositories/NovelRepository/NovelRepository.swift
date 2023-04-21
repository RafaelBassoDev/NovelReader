//
//  NovelRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

class NovelRepository: NovelRepositoreable {
    private var currentNovel: Novel?
    private var currentChapterNumber: Int?
    
    private let storage: NovelStorable
    
    init(storage: NovelStorable) {
        self.storage = storage
    }
}

extension NovelRepository {
    func setCurrentNovel(_ novel: Novel) {
        self.currentNovel = novel
        self.currentChapterNumber = nil
    }
    
    func setCurrentChapter(_ chapter: Chapter) {
        self.currentChapterNumber = chapter.number
    }
}

extension NovelRepository {
    func getStoredNovels() async -> [Novel] {
        return await storage.getStoredNovels()
    }
    
    func getStoredChapters(of novel: Novel) async -> [Chapter] {
        return await storage.getStoredChapters(of: novel)
    }
    
    func getNextChapter() async -> Chapter? {
        guard let currentChapterNumber, currentChapterNumber + 1 <= 5 else {
            return nil
        }
        guard let chapter = await storage.getStoredChapter(number: currentChapterNumber + 1) else {
            return nil
        }
        return chapter
    }
    
    func getPreviousChapter() async -> Chapter? {
        guard let currentChapterNumber, currentChapterNumber - 1 > 0 else {
            return nil
        }
        guard let chapter = await storage.getStoredChapter(number: currentChapterNumber - 1) else {
            return nil
        }
        return chapter
    }
    
    func getChapterContent(_ chapter: Chapter) async -> String {
        let storedContent = await storage.getStoredContent(of: chapter)
        setCurrentChapter(chapter)
        return storedContent
    }
}
