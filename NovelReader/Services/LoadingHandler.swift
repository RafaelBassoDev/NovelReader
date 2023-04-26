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
    
    private weak var rootViewController: UIViewController?
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func startLoading() {
        DispatchQueue.main.sync {
            loadingController.startAnimation()
            rootViewController?.present(loadingController, animated: false)
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.sync {
            loadingController.stopAnimation()
        }
    }
}
