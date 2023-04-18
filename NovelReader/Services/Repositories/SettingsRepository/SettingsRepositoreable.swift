//
//  SettingsRepositoreable.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

protocol SettingsRepositoreable: AnyObject {
    func getAvailableFonts() -> [UIFont]
    func getCurrentFont() -> UIFont
    func setFontSize(_ size: Float)
    func setFontFamily(_ fontFamily: String)
}
