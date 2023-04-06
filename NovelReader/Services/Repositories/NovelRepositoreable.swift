//
//  NovelRepositoreable.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

protocol NovelRepositoreable {
    var novels: [Novel] { get }
    var currentNovel: Novel? { get }
    var currentChapter: Chapter? { get }
    var currentChapterIndex: Int? { get }
    
    func setCurrentNovel(_ novel: Novel)
    func setCurrentChapter(_ chapter: Chapter)
    func getNextChapter() -> Chapter?
}
