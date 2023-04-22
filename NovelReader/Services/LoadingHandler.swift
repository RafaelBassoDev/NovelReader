//
//  LoadingHandler.swift
//  NovelReader
//
//  Created by Rafael Basso on 22/04/23.
//

import UIKit

struct LoadingHandler {
    
    private let loadingController: LoadingViewController = {
        let controller = LoadingViewController()
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        return controller
    }()
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startLoading() {
        DispatchQueue.main.async {
            self.navigationController?.present(loadingController, animated: true)
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.loadingController.dismiss(animated: true)
        }
    }
}
