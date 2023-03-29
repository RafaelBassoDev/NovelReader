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
        print(dataSource[indexPath.row].title)
    }
}
