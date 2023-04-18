//
//  SettingsRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

class SettingsRepository: SettingsRepositoreable {
    private var availableFontFamilies = [
        "SFPro",
        "Arial",
        "Comic Sans",
        "Times New York"
    ]
    
    var currentFontFamily: String!
    var currentFontSize: Float!
    
    let settingsStorage: SettingsStorable
    
    init(storage: SettingsStorable) {
        self.settingsStorage = storage
        currentFontFamily = settingsStorage.getFontFamily()
        currentFontSize = settingsStorage.getFontSize()
    }
}

extension SettingsRepository {
    func getAvailableFontFamilyNames() -> [String] {
        return availableFontFamilies
    }
    
    func getLatestUIFontSettings() -> UIFont {
        return UIFont.systemFont(ofSize: CGFloat(currentFontSize), weight: .regular)
    }
    
    func setFontSize(_ size: Float) {
        if size != currentFontSize {
            currentFontSize = size
            settingsStorage.setFontSize(size)
        }
    }
    
    func setFontFamily(_ fontFamily: String) {
        if fontFamily != currentFontFamily {
            currentFontFamily = fontFamily
            settingsStorage.setFontFamily(fontFamily)
        }
    }
}
