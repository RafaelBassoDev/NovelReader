//
//  NovelCollectionViewModel.swift
//  NovelReader
//
//  Created by Rafael Basso on 06/04/23.
//

import Foundation

class NovelCollectionViewModel {
    
    let novelList: [Novel]
    let novelCount: Int
    
    init(novelList: [Novel] = []) {
        self.novelList = novelList
        self.novelCount = novelList.count
    }
    
    func getNovel(at indexPath: IndexPath) -> Novel {
        let index = indexPath.row
        return novelList[index]
    }
    
}
