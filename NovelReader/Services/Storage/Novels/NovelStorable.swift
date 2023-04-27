//
//  NovelStorable.swift
//  NovelReader
//
//  Created by Rafael Basso on 20/04/23.
//

import Foundation

protocol NovelStorable: AnyObject {
    func getStoredNovels() async -> [NovelModel]
    func getStoredChapters(of novel: NovelModel) async -> [Chapter]
    func getStoredChapter(number: Int) async -> Chapter?
    func getStoredContent(of chapter: Chapter) async -> String
}
