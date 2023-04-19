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
            showAlert(
                title: "Last chapter reached!",
                message: "It seems that there are no more chapters to read! Return to chapter list?",
                options: [
                    .cancel(),
                    .ok { [weak self] in
                        self?.popToChapterList()
                    }
                ]
            )
        }
    }
    
    func showPreviousChapter() {
        if let previousChapter = novelRepository.getPreviousChapter() {
            showReadingView(for: previousChapter)
        } else {
            showAlert(
                title: "Error",
                message: "Could not find previous chapter.",
                options: [
                    .ok()
                ]
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
    enum AlertOptions {
        // swiftlint: disable identifier_name
        case ok(_ completionHandler: (() -> Void)? = nil)
        // swiftlint: enable identifier_name
        case cancel(_ completionHandler: (() -> Void)? = nil)
        case destructive(_ completionHandler: (() -> Void)? = nil)
        
        func getAction() -> UIAlertAction {
            var title: String
            var style: UIAlertAction.Style
            var handler: () -> Void
            
            switch self {
            case .ok(let completion):
                title = "Ok"
                style = .default
                handler = completion ?? {}
                
            case .cancel(let completion):
                title = "Cancel"
                style = .cancel
                handler = completion ?? {}
                
            case .destructive(let completion):
                title = "Cancel"
                style = .destructive
                handler = completion ?? {}
            }
            
            return UIAlertAction(title: title, style: style) { _ in handler() }
        }
    }
    
    func showAlert(
        title: String,
        message: String,
        options: [AlertOptions]
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for option in options {
            let action = option.getAction()
            alertController.addAction(action)
        }

        navigationController.present(alertController, animated: true)
    }
}
