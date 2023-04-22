//
//  Coordinator.swift
//  NovelReader
//
//  Created by Rafael Basso on 28/03/23.
//

import UIKit

final class Coordinator {
    private let navigationController: UINavigationController
    private let novelRepository: NovelRepositoreable
    private let settingsRepository: SettingsRepositoreable
    private let loadingHandler: LoadingHandler
    
    init(navigationController: UINavigationController, novelRepository: NovelRepositoreable, settingsRepository: SettingsRepositoreable) {
        self.navigationController = navigationController
        self.novelRepository = novelRepository
        self.settingsRepository = settingsRepository
        self.loadingHandler = LoadingHandler(navigationController: navigationController)
    }
    
    func start() {
        Task(priority: .userInitiated) {
            let novels = await novelRepository.getStoredNovels()
            
            DispatchQueue.main.async {
                let viewModel = NovelCollectionViewModel(novels: novels)
                let viewController = NovelCollectionViewController(viewModel: viewModel)
                viewController.coordinator = self
                viewController.title = "Novels"
                viewController.modalPresentationStyle = .fullScreen
                
                self.navigationController.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
}

extension Coordinator {
    func showChapterList(for novel: Novel) {
        Task(priority: .userInitiated) {
            let chapterList = await novelRepository.getStoredChapters(of: novel)
            
            DispatchQueue.main.async {
                let viewModel = ChapterListViewModel(chapters: chapterList)
                let viewController = ChapterListViewController(viewModel: viewModel)
                viewController.coordinator = self
                viewController.title = "Chapters"
                
                self.navigationController.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func showReadingView(for chapter: Chapter) {
        
        Task(priority: .userInitiated) {
            
            // show loading screen
            
            let storedContent = await novelRepository.getChapterContent(chapter)
            let chapterWithStoredContent = chapter.withContent(storedContent)
            
            DispatchQueue.main.async {
                let viewModel = ReadingViewModel(chapter: chapterWithStoredContent)
                let viewController = ReadingViewController(viewModel: viewModel, settingsRepository: self.settingsRepository)
                viewController.coordinator = self
                
                self.navigationController.pushViewController(viewController, animated: true)
            }
            
        }
    }
    
    func showSettings() {
        let viewController = SettingsViewController(repository: settingsRepository)
        viewController.title = "Settings"
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNextChapter() {
        Task(priority: .userInitiated) {
            
            // show loading screen
            
            if let chapter = await novelRepository.getNextChapter() {
                DispatchQueue.main.async { [weak self] in
                    self?.showReadingView(for: chapter)
                }
                
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.showAlert(
                        title: "Last chapter reached!",
                        message: "It seems that there are no more chapters to read! Return to chapter list?",
                        options: [
                            .cancel(),
                            .ok {
                                self?.popToChapterList()
                            }
                        ]
                    )
                }
            }
        }
    }
    
    func showPreviousChapter() {
        Task(priority: .userInitiated) {
            
            // show loading screen
            
            if let chapter = await novelRepository.getPreviousChapter() {
                DispatchQueue.main.async { [weak self] in
                    self?.showReadingView(for: chapter)
                }
                
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.showAlert(
                        title: "Error",
                        message: "Could not find previous chapter.",
                        options: [
                            .ok()
                        ]
                    )
                }
            }
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
    enum AlertOption {
        // swiftlint: disable identifier_name
        case ok(label: String = "Ok", _ completionHandler: (() -> Void)? = nil)
        // swiftlint: enable identifier_name
        case cancel(label: String = "Cancel", _ completionHandler: (() -> Void)? = nil)
        case destructive(label: String = "Cancel", _ completionHandler: (() -> Void)? = nil)
        
        func getAction() -> UIAlertAction {
            var title: String
            var style: UIAlertAction.Style
            var handler: () -> Void
            
            switch self {
            case .ok(let label, let completion):
                title = label
                style = .default
                handler = completion ?? {}
                
            case .cancel(let label, let completion):
                title = label
                style = .cancel
                handler = completion ?? {}
                
            case .destructive(let label, let completion):
                title = label
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
