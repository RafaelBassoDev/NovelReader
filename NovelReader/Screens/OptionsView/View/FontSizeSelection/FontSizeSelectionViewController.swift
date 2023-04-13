//
//  FontSizeSelectionView.swift
//  NovelReader
//
//  Created by Rafael Basso on 31/03/23.
//

import UIKit

class FontSizeSelectionViewController: UIViewController {
    
    private(set) lazy var referenceText: UILabel = {
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
    
    private(set) lazy var sliderView: SizeSliderView = {
        let sliderView = SizeSliderView()
        sliderView.backgroundColor = .darkGray.withAlphaComponent(0.3)
        sliderView.layer.borderWidth = 0.2
        sliderView.layer.borderColor = UIColor.gray.cgColor
        return sliderView
    }()
    
    private weak var repository: SettingsRepository?
    
    init(repository: SettingsRepository?) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Font Size"
        self.view.backgroundColor = .black
        
        view.addSubview(referenceText)
        view.addSubview(sliderView)
        
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
        
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sliderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            sliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
