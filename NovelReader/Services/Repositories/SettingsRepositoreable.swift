//
//  SettingsRepositoreable.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

protocol SettingsRepositoreable: AnyObject {
    func getLatestUIFontSettings() -> UIFont
}
