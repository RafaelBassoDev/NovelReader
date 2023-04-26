//
//  NovelCollectionViewController.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import UIKit

class NovelCollectionViewController: UICollectionViewController, Coordinatable {
    weak var coordinator: Coordinator?
    
    private var viewModel: NovelCollectionViewModel!
    
    init(viewModel: NovelCollectionViewModel) {
        self.viewModel = viewModel
        
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
    func setNovelList(to novels: [Novel]) {
        viewModel.setNovels(novels)
        self.collectionView.reloadData()
    }
}

extension NovelCollectionViewController {
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.novelCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NovelCollectionViewCell.reuseIdentifier, for: indexPath) as? NovelCollectionViewCell else {
            return UICollectionViewCell()
        }
        let novel = viewModel.getNovel(at: indexPath)
        cell.configure(with: novel)
        return cell
    }
}

extension NovelCollectionViewController {
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let novel = viewModel.getNovel(at: indexPath)
        coordinator?.showChapterList(for: novel)
    }
}
