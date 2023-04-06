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
        
        self.novelRepository.setCurrentChapter(chapter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSettings() {
        let viewController = SettingsViewController()
        viewController.title = "Settings"
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    // swiftlint:disable trailing_closure
    func showNextChapter() {
        if let nextChapter = novelRepository.getNextChapter() {
            showReadingView(for: nextChapter)
        } else {
            showAlert(
                title: "That's all folks!",
                message: "It seems that there are no more chapters to read! Return to chapter list?",
                defaultAction: {
                    let presentedViewControllers = self.navigationController.viewControllers
                    for controller in presentedViewControllers where controller.title == "Chapters" {
                        self.navigationController.popToViewController(controller, animated: true)
                        break
                    }
                }
            )
        }
    }
    // swiftlint:enable trailing_closure
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
