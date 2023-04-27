//
//  NovelStorage.swift
//  NovelReader
//
//  Created by Rafael Basso on 20/04/23.
//

import Foundation

class NovelStorage: NovelStorable {
    
    private var dataSource: [ChapterModel] = {
        var chapters = [ChapterModel]()
        for num in 1...5 {
            chapters.append(ChapterModel(number: num, title: "Chapter \(num)", subtitle: "The subtitle of chapter \(num)"))
        }
        return chapters
    }()
    
    func getStoredNovels() async -> [NovelModel] {
        return [
            NovelModel(title: "A Will Eternal"),
            NovelModel(title: "Immortal Renagate")
        ]
    }
    
    func getStoredChapters(of novel: NovelModel) async -> [ChapterModel] {
        return dataSource
    }
    
    // Chapter without content
    func getStoredChapter(number: Int) async -> ChapterModel? {
        return dataSource[number - 1]
    }
    
    // swiftlint:disable all
    func getStoredContent(of chapter: ChapterModel) async -> String {
        return """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id.
        
        Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id.
        
        Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo.
        """
    }
}
