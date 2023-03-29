//
//  CellIdentifiable.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import Foundation

protocol CellIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
}
