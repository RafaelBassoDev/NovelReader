//
//  NovelCollectionViewController.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import UIKit

class NovelCollectionViewController: UICollectionViewController, Coordinatable {
    weak var coordinator: Coordinator?
    
    let dataSource = [
        Novel(
            title: "A Will Eternal",
            chapters: [
                Chapter(title: "Chapter 01", content: "some text")
            ]
        ),
        Novel(
            title: "Immortal renegade",
            chapters: [
                Chapter(title: "Chapter 01", content: "some text")
            ]
        ),
        Novel(
            title: "I Shal Seal The Heavens",
            chapters: [
                Chapter(title: "Chapter 01", content: "some text")
            ]
        )
    ]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        let width = 180
        let height = 300
        layout.itemSize = CGSize(width: width, height: height)
        layout.estimatedItemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 20
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(NovelCollectionViewCell.self, forCellWithReuseIdentifier: NovelCollectionViewCell.reuseIdentifier)
    }
}

extension NovelCollectionViewController {
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NovelCollectionViewCell.reuseIdentifier, for: indexPath) as? NovelCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let novel = dataSource[indexPath.row]
        
        cell.configure(with: novel)
        
        return cell
    }
}

extension NovelCollectionViewController {
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let novel = dataSource[indexPath.row]
        coordinator?.showChapterList(for: novel)
    }
}
