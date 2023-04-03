//
//  FontSizeSelectionView.swift
//  NovelReader
//
//  Created by Rafael Basso on 31/03/23.
//

import UIKit

class FontSizeSelectionViewController: UIViewController {
    
    lazy var referenceText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.text = "The quick brown fox jumps over the lazy dog."
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.sizeToFit()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Font Size"
        
        view.addSubview(referenceText)
        
        setupConstraints()
    }
}

extension FontSizeSelectionViewController {
    private func setupConstraints() {
        
        referenceText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            referenceText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            referenceText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            referenceText.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}
