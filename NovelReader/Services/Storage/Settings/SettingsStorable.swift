//
//  SettingsStorable.swift
//  NovelReader
//
//  Created by Rafael Basso on 18/04/23.
//

import UIKit

protocol SettingsStorable: AnyObject {
    func getAvailableFontsFamilies() -> [UIFont]
    func getFontFamily() -> String
    func getFontSize() -> Float
    func setFontFamily(_ fontFamily: String)
    func setFontSize(_ size: Float)
}
