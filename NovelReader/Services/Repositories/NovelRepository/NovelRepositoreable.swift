//
//  NovelRepositoreable.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

protocol NovelRepositoreable {
    func getStoredNovels() async -> [NovelModel]
    func getStoredChapters(of novel: NovelModel) async -> [ChapterModel]
    func getChapter(number: Int) async -> ChapterModel?
    func getNextChapter() async -> ChapterModel?
    func getPreviousChapter() async -> ChapterModel?
}
