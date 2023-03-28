//
//  UINavigationController.swift
//  NovelReader
//
//  Created by Rafael Basso on 28/03/23.
//

import UIKit.UINavigationController
import UIKit.UINavigationBar

extension UINavigationController {
    func setCustomAppearance() {
        navigationBar.setCustomCompactAppearance()
        navigationBar.setCustomScrollEdgeAppearance()
    }
}

extension UINavigationBar {
    func setCustomCompactAppearance() {
        let defaultAppearance = UINavigationBarAppearance()
        
        defaultAppearance.configureWithTransparentBackground()
        defaultAppearance.backgroundColor = .black
        defaultAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        
        self.standardAppearance = defaultAppearance
        self.compactAppearance = defaultAppearance
    }
    
    func setCustomScrollEdgeAppearance() {
        let scrollAppearance = UINavigationBarAppearance()
        
        scrollAppearance.configureWithOpaqueBackground()
        scrollAppearance.backgroundColor = .black
        scrollAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        
        self.scrollEdgeAppearance = scrollAppearance
    }
}
