//
//  NovelStorage.swift
//  NovelReader
//
//  Created by Rafael Basso on 20/04/23.
//

import Foundation

class NovelStorage: NovelStorable {
    
    private var dataSource: [Chapter] = {
        var chapters = [Chapter]()
        for num in 1...5 {
            chapters.append(Chapter(number: num, title: "Chapter \(num)", subtitle: "The subtitle of chapter \(num)"))
        }
        return chapters
    }()
    
    func getStoredNovels() async -> [Novel] {
        return [
            Novel(title: "A Will Eternal"),
            Novel(title: "Immortal Renagate")
        ]
    }
    
    func getStoredChapters(of novel: Novel) async -> [Chapter] {
        return dataSource
    }
    
    // Chapter without content
    func getStoredChapter(number: Int) async -> Chapter? {
        return dataSource[number - 1]
    }
    
    // swiftlint:disable all
    func getStoredContent(of chapter: Chapter) async -> String {
        return """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id.
        
        Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id.
        
        Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra bibendum libero, quis sollicitudin nibh eleifend id. Pellentesque at iaculis leo.
        """
    }
}
