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
        let layout = UICollectionViewFlowLayout()
        
        let width = 180
        let height = 250
        layout.itemSize = CGSize(width: width, height: height)
        layout.estimatedItemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let viewController = NovelCollectionViewController(collectionViewLayout: layout)
        
        viewController.coordinator = self
        
        viewController.title = "Novels"
        
        viewController.modalPresentationStyle = .fullScreen
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
}
