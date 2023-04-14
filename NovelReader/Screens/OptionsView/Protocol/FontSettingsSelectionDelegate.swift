//
//  FontSettingsSelectionDelegate.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import Foundation

protocol FontSettingsSelectionDelegate: AnyObject {
    func didSetFontSize(to newSize: Float)
    func didSetFontFamily(to fontFamily: String)
}
