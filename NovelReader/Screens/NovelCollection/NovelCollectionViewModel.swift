//
//  NovelCollectionViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

struct NovelCollectionViewModel {
    private var novels: [Novel]
    
    init(novels: [Novel] = []) {
        self.novels = novels
    }
}

extension NovelCollectionViewModel {
    var novelCount: Int {
        novels.count
    }
    
    func getNovel(at indexPath: IndexPath) -> Novel {
        let index = indexPath.row
        return novels[index]
    }
    
    mutating func setNovels(_ novels: [Novel]) {
        self.novels = novels
    }
}
