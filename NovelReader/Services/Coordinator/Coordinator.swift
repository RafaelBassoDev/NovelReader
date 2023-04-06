//
//  Coordinator.swift
//  NovelReader
//
//  Created by Rafael Basso on 28/03/23.
//

import UIKit

final class Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = NovelCollectionViewModel()
        let viewController = NovelCollectionViewController(viewModel: viewModel)
        viewController.coordinator = self
        viewController.title = "Novels"
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func showChapterList(for novel: Novel) {
        let viewModel = ChapterListViewModel(chapters: novel.chapters)
        let viewController = ChapterListViewController(viewModel: viewModel)
        viewController.coordinator = self
        viewController.title = "Chapters"
        
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
}
