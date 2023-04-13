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
    
    lazy var nextChapterButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        config.cornerStyle = .medium
        config.title = "Next"
        config.baseBackgroundColor = .systemBlue
        
        let button = UIButton(configuration: config)
        return button
    }()
    
    lazy var chapterListButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        config.cornerStyle = .medium
        config.title = "Chapters"
        config.baseBackgroundColor = .systemBrown
        
        let button = UIButton(configuration: config)
        return button
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
        
        nextChapterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextChapterButton.topAnchor.constraint(equalTo: contentText.bottomAnchor, constant: 60),
            nextChapterButton.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -40),
            nextChapterButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20),
            nextChapterButton.widthAnchor.constraint(equalToConstant: 120),
            nextChapterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        chapterListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chapterListButton.centerYAnchor.constraint(equalTo: nextChapterButton.centerYAnchor),
            chapterListButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -20),
            chapterListButton.widthAnchor.constraint(equalToConstant: 120),
            chapterListButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
