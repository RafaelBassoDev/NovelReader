//
//  NovelStorage.swift
//  NovelReader
//
//  Created by Rafael Basso on 20/04/23.
//

import UIKit
import CoreData

class NovelStorage: NovelStorable {

    // swiftlint:disable force_cast
    private let managedContext: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    // swiftlint:enable force_cast
    
    func getStoredNovels() async -> [NovelModel] {
        var storedNovels = [NovelModel]()
        
        do {
            let request = NSFetchRequest<NSManagedObject>(entityName: "Novel")
            let fetchedNovels = try managedContext.fetch(request)
            
            for novel in fetchedNovels {
                guard let title = novel.value(forKey: "title") as? String else { continue }
//                let poster = novel.value(forKey: "poster")
                let model = NovelModel(title: title)
                storedNovels.append(model)
            }
        } catch {
            print("ERROR::[NovelStorage]-getStoredNovels")
            print(error)
        }
            
        return storedNovels
    }
    
    func getStoredChapters(of novel: NovelModel) async -> [ChapterModel] {
        var storedChapters = [ChapterModel]()
        
        do {
            let request = NSFetchRequest<NSManagedObject>(entityName: "Chapter")
            request.predicate = NSPredicate(format: "novel.title == %@", novel.title)
            
            let fetchedChapters = try managedContext.fetch(request)
            
            for chapter in fetchedChapters {
                guard let number = chapter.value(forKey: "number") as? Int else { continue }
                guard let title = chapter.value(forKey: "title") as? String else { continue }
                let subtitle = chapter.value(forKey: "subtitle") as? String
                
                let model = ChapterModel(number: number, title: title, subtitle: subtitle)
                storedChapters.append(model)
            }
        } catch {
            print("ERROR::[NovelStorage]-getStoredChapters(novel:_)")
            print(error)
        }
        
        return storedChapters.sorted { $0.number < $1.number }
    }
    
    func getStoredChapter(of novel: NovelModel, number: Int) async -> ChapterModel? {
        var fetchedChapter: ChapterModel?
        do {
            let request = NSFetchRequest<NSManagedObject>(entityName: "Chapter")
            request.predicate = NSPredicate(format: "novel.title == %@ AND number == %d", novel.title, number)
            
            if let chapter = try managedContext.fetch(request).first {
                guard let number = chapter.value(forKey: "number") as? Int else { return nil }
                guard let title = chapter.value(forKey: "title") as? String else { return nil }
                guard let content = chapter.value(forKey: "content") as? String else { return nil }
                let subtitle = chapter.value(forKey: "subtitle") as? String

                fetchedChapter = ChapterModel(number: number, title: title, subtitle: subtitle, content: content)
            }
        } catch {
            print("ERROR::[NovelStorage]-getStoredChapter(novel:_, number:_)")
            print(error)
        }
        return fetchedChapter
    }
}
