//
//  SettingsRepositoreable.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

protocol SettingsRepositoreable: AnyObject {
    func getAvailableFontFamilyNames() -> [String]
    func getLatestUIFontSettings() -> UIFont
    func setFontSize(_ size: Float)
    func setFontFamily(_ fontFamily: String)
}
