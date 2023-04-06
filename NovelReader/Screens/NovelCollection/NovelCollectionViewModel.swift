//
//  NovelCollectionViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

class NovelCollectionViewModel {
    let novels: [Novel]
    
    var novelCount: Int {
        novels.count
    }
    
    init(novels: [Novel]) {
        self.novels = novels
    }
    
    func getNovel(at indexPath: IndexPath) -> Novel {
        let index = indexPath.row
        return novels[index]
    }
    
}
