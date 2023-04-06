//
//  Coordinator.swift
//  NovelReader
//
//  Created by Rafael Basso on 28/03/23.
//

import UIKit

final class Coordinator {
    var navigationController: UINavigationController
    
    var novelRepository: NovelRepositoreable
    
    init(navigationController: UINavigationController, repository: NovelRepositoreable) {
        self.navigationController = navigationController
        self.novelRepository = repository
    }
    
    func start() {
        let viewModel = NovelCollectionViewModel(novels: novelRepository.novels)
        let viewController = NovelCollectionViewController(viewModel: viewModel)
        viewController.coordinator = self
        viewController.title = "Novels"
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
}

extension Coordinator {
    func showChapterList(for novel: Novel) {
        let viewModel = ChapterListViewModel(chapters: novel.chapters)
        let viewController = ChapterListViewController(viewModel: viewModel)
        viewController.coordinator = self
        viewController.title = "Chapters"
        
        self.novelRepository.setCurrentNovel(novel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showReadingView(for chapter: Chapter) {
        let viewController = ReadingViewController(chapter: chapter)
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSettings() {
        let viewController = SettingsViewController()
        viewController.title = "Settings"
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNextChapter() {
        guard let nextChapter = novelRepository.getNextChapter() else {
            return
            // show error - end of chapters, return to chapter list?
        }
        let viewController = ReadingViewController(chapter: nextChapter)
        navigationController.pushViewController(viewController, animated: true)
    }
}
