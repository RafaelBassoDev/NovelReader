//
//  NovelRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

class NovelRepository: NovelRepositoreable {
    private var currentNovel: NovelModel?
    private var currentChapterNumber: Int?
    
    private let storage: NovelStorable
    
    init(storage: NovelStorable) {
        self.storage = storage
    }
}

extension NovelRepository {
    func setCurrentNovel(_ novel: NovelModel) {
        self.currentNovel = novel
        self.currentChapterNumber = nil
    }
    
    func setCurrentChapter(_ chapter: ChapterModel) {
        self.currentChapterNumber = chapter.number
    }
}

extension NovelRepository {
    func getStoredNovels() async -> [NovelModel] {
        return await storage.getStoredNovels()
    }
    
    func getStoredChapters(of novel: NovelModel) async -> [ChapterModel] {
        setCurrentNovel(novel)
        return await storage.getStoredChapters(of: novel)
    }
    
    func getChapter(number: Int) async -> ChapterModel? {
        guard let currentNovel else { return nil }
        guard let chapter = await storage.getStoredChapter(of: currentNovel, number: number) else { return nil }
        setCurrentChapter(chapter)
        return chapter
    }
    
    func getNextChapter() async -> ChapterModel? {
        guard let currentChapterNumber else { return nil }
        return await getChapter(number: currentChapterNumber + 1)
    }
    
    func getPreviousChapter() async -> ChapterModel? {
        guard let currentChapterNumber else { return nil }
        return await getChapter(number: currentChapterNumber - 1)
    }
}
