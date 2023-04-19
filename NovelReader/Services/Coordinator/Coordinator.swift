//
//  Coordinator.swift
//  NovelReader
//
//  Created by Rafael Basso on 28/03/23.
//

import UIKit

final class Coordinator {
    var navigationController: UINavigationController
    
    let novelRepository: NovelRepositoreable
    let settingsRepository: SettingsRepositoreable
    
    init(navigationController: UINavigationController, novelRepository: NovelRepositoreable, settingsRepository: SettingsRepositoreable) {
        self.navigationController = navigationController
        self.novelRepository = novelRepository
        self.settingsRepository = settingsRepository
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
        let viewModel = ReadingViewModel(chapter: chapter)
        let viewController = ReadingViewController(viewModel: viewModel, settingsRepository: settingsRepository)
        viewController.coordinator = self
        
        self.novelRepository.setCurrentChapter(chapter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSettings() {
        let viewController = SettingsViewController(repository: settingsRepository)
        viewController.title = "Settings"
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNextChapter() {
        if let nextChapter = novelRepository.getNextChapter() {
            showReadingView(for: nextChapter)
        } else {
            // swiftlint:disable trailing_closure
            showAlert(
                title: "Last chapter reached!",
                message: "It seems that there are no more chapters to read! Return to chapter list?",
                defaultAction: {
                    self.popToChapterList()
                }
            )
            // swiftlint:enable trailing_closure
        }
    }
    
    func showPreviousChapter() {
        if let previousChapter = novelRepository.getPreviousChapter() {
            showReadingView(for: previousChapter)
        } else {
            showAlert(
                title: "Error",
                message: "Could not find previous chapter."
            )
        }
    }
    
    func popToChapterList() {
        let presentedViewControllers = self.navigationController.viewControllers
        for controller in presentedViewControllers where controller.title == "Chapters" {
            self.navigationController.popToViewController(controller, animated: true)
            break
        }
    }
}

extension Coordinator {
    func showAlert(
        title: String,
        message: String,
        defaultAction defaultCompletionHandler: (() -> Void)? = nil,
        cancelAction cancelCompletionHandler: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            defaultCompletionHandler?()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            cancelCompletionHandler?()
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        navigationController.present(alertController, animated: true)
    }
}
