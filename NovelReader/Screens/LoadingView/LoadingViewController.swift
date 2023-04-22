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
        loadingView.color = .white
        loadingView.startAnimating()
        return loadingView
    }()
    
    private(set) lazy var loadingText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.text = "Loading..."
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private(set) lazy var loadingBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        return view
    }()
    
    private(set) lazy var blurEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: effect)
        view.alpha = 0.5
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black.withAlphaComponent(0.2)
        
        view.insertSubview(blurEffectView, at: 0)
        
        view.addSubview(loadingBackground)
        
        loadingBackground.addSubview(loadingindicator)
        loadingBackground.addSubview(loadingText)
        
        setConstraints()
    }
}

extension LoadingViewController {
    private func setConstraints() {
        
        setBlurEffectView()
        
        loadingBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingBackground.widthAnchor.constraint(equalToConstant: view.frame.width * 0.4),
            loadingBackground.heightAnchor.constraint(equalToConstant: view.frame.width * 0.4)
        ])
        
        loadingindicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingindicator.centerXAnchor.constraint(equalTo: loadingBackground.centerXAnchor),
            loadingindicator.centerYAnchor.constraint(equalTo: loadingBackground.centerYAnchor, constant: (loadingindicator.frame.height * 0.5) * -1)
        ])

        loadingText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingText.topAnchor.constraint(equalTo: loadingindicator.bottomAnchor, constant: 15),
            loadingText.centerXAnchor.constraint(equalTo: loadingindicator.centerXAnchor)
        ])
    }
    
    private func setBlurEffectView() {
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffectView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurEffectView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}
