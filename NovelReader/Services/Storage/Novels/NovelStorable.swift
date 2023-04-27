//
//  NovelStorable.swift
//  NovelReader
//
//  Created by Rafael Basso on 20/04/23.
//

import Foundation

protocol NovelStorable: AnyObject {
    func getStoredNovels() async -> [NovelModel]
    func getStoredChapters(of novel: NovelModel) async -> [ChapterModel]
    func getStoredChapter(number: Int) async -> ChapterModel?
    func getStoredContent(of chapter: ChapterModel) async -> String
}
