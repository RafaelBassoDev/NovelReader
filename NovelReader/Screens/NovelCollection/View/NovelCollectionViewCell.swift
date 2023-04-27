//
//  NovelCollectionViewCell.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import UIKit

class NovelCollectionViewCell: UICollectionViewCell, CellIdentifiable {
    static var reuseIdentifier: String = "NovelCollectionCell"
    
    lazy var poster: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var title: UITextView = {
        let view = UITextView()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.backgroundColor = .clear
        view.textAlignment = .center
        
        view.isEditable = false
        view.isScrollEnabled = false
        
        view.textContainer.maximumNumberOfLines = 2
        view.textContainer.lineBreakMode = .byTruncatingTail
        return view
    }()
    
    func configure(with novel: NovelModel) {
        self.poster.image = novel.poster
        self.title.text = novel.title
        
        contentView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        contentView.addSubview(poster)
        contentView.addSubview(title)
        
        setConstraints()
    }
    
    private func setConstraints() {
        poster.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            poster.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            poster.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            poster.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            poster.widthAnchor.constraint(equalToConstant: 160),
            poster.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            title.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
