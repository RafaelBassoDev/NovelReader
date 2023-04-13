//
//  SettingsRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

class SettingsRepository {
    // saveSettings
    // updateSettings
    
    func getLatestUIFontSettings() -> UIFont {
        return UIFont.systemFont(ofSize: CGFloat.random(in: 12...60), weight: .regular)
    }
}
