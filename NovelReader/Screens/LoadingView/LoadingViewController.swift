//
//  LoadingViewController.swift
//  NovelReader
//
//  Created by Rafael Basso on 21/04/23.
//

import UIKit

class LoadingViewController: UIViewController {

    private(set) lazy var loadingindicator: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .large)
        
        loadingView.style = .large
        loadingView.color = .white
        
        loadingView.startAnimating()
        
        loadingView.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]
        
        return loadingView
    }()
    
    private(set) lazy var blurEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: effect)
        
        view.alpha = 0.5
        
        view.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black.withAlphaComponent(0.5)
        
        setBlurEffect()
        setLoadingIndicator()
    }
}

extension LoadingViewController {
    private func setBlurEffect() {
        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, at: 0)
    }
    
    private func setLoadingIndicator() {
        loadingindicator.center = CGPoint(
            x: view.bounds.midX,
            y: view.bounds.midY
        )
        view.addSubview(loadingindicator)
    }
}
