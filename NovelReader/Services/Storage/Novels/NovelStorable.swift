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
    func getStoredChapter(of novel: NovelModel, number: Int) async -> ChapterModel?
}
