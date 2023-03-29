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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
