//
//  ReadingViewController.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import UIKit

class ReadingViewController: UIViewController, Coordinatable {
    weak var coordinator: Coordinator?

    private var viewModel: ReadingViewModel!
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .systemCyan
        label.sizeToFit()
        return label
    }()

    lazy var contentText: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    lazy var previousChapterButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        config.cornerStyle = .medium
        config.baseBackgroundColor = .white.withAlphaComponent(0.15)
        
        let symbolConfig = UIImage.SymbolConfiguration(weight: .bold)
        let symbol = UIImage(systemName: "chevron.left", withConfiguration: symbolConfig)
        config.image = symbol
        
        return UIButton(configuration: config)
    }()
    
    lazy var nextChapterButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        config.cornerStyle = .medium
        config.baseBackgroundColor = .white.withAlphaComponent(0.15)
        
        let symbolConfig = UIImage.SymbolConfiguration(weight: .bold)
        let symbol = UIImage(systemName: "chevron.right", withConfiguration: symbolConfig)
        config.image = symbol
        
        return UIButton(configuration: config)
    }()
    
    lazy var chapterListButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        config.cornerStyle = .medium
        config.baseBackgroundColor = .systemBrown.withAlphaComponent(0.5)
        
        let symbolConfig = UIImage.SymbolConfiguration(weight: .bold)
        let symbol = UIImage(systemName: "line.3.horizontal", withConfiguration: symbolConfig)
        config.image = symbol
        
        return UIButton(configuration: config)
    }()
    
    init(viewModel: ReadingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Settings",
            style: .plain,
            target: self,
            action: #selector(settingButtonPressed)
        )
        
        previousChapterButton.addAction(
            UIAction { [weak self] _ in
                self?.coordinator?.showPreviousChapter()
            }, for: .touchUpInside
        )
        
        nextChapterButton.addAction(
            UIAction { [weak self] _ in
                self?.coordinator?.showNextChapter()
            }, for: .touchUpInside
        )
        
        chapterListButton.addAction(
            UIAction { [weak self] _ in
                self?.coordinator?.popToChapterList()
            }, for: .touchUpInside
        )
        
        view.backgroundColor = .black
        
        titleLabel.text = viewModel.title
        contentText.text = viewModel.content
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentText)
        contentView.addSubview(previousChapterButton)
        contentView.addSubview(nextChapterButton)
        contentView.addSubview(chapterListButton)
        
        setConstraints()
    }
    
    @objc
    func settingButtonPressed() {
        coordinator?.showSettings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ReadingViewController {
    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor)
        ])
        
        contentText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentText.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            contentText.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
        
        chapterListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chapterListButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            chapterListButton.topAnchor.constraint(equalTo: contentText.bottomAnchor, constant: 60),
            chapterListButton.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            chapterListButton.widthAnchor.constraint(equalToConstant: 70),
            chapterListButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        previousChapterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previousChapterButton.centerYAnchor.constraint(equalTo: chapterListButton.centerYAnchor),
            previousChapterButton.trailingAnchor.constraint(equalTo: chapterListButton.leadingAnchor, constant: -25),
            previousChapterButton.widthAnchor.constraint(equalToConstant: 70),
            previousChapterButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        nextChapterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextChapterButton.centerYAnchor.constraint(equalTo: chapterListButton.centerYAnchor),
            nextChapterButton.leadingAnchor.constraint(equalTo: chapterListButton.trailingAnchor, constant: 25),
            nextChapterButton.widthAnchor.constraint(equalToConstant: 70),
            nextChapterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
