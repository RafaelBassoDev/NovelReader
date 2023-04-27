//
//  NovelCollectionViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

struct NovelCollectionViewModel {
    private var novels: [NovelModel]
    
    init(novels: [NovelModel] = []) {
        self.novels = novels
    }
}

extension NovelCollectionViewModel {
    var novelCount: Int {
        novels.count
    }
    
    func getNovel(at indexPath: IndexPath) -> NovelModel {
        let index = indexPath.row
        return novels[index]
    }
    
    mutating func setNovels(_ novels: [NovelModel]) {
        self.novels = novels
    }
}
