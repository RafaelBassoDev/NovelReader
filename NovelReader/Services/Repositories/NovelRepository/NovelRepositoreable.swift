//
//  NovelRepositoreable.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

protocol NovelRepositoreable {
    func getStoredNovels() async -> [NovelModel]
    func getStoredChapters(of novel: NovelModel) async -> [Chapter]
    func getNextChapter() async -> Chapter?
    func getPreviousChapter() async -> Chapter?
    func getChapterContent(_ chapter: Chapter) async -> String
}
