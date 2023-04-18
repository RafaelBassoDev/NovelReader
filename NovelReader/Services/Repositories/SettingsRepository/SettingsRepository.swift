//
//  SettingsRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

class SettingsRepository {
    var currentFontFamily: String!
    var currentFontSize: Float!
    
    let settingsStorage: SettingsStorable
    
    init(storage: SettingsStorable) {
        self.settingsStorage = storage
        currentFontFamily = settingsStorage.getFontFamily()
        currentFontSize = settingsStorage.getFontSize()
    }
}

extension SettingsRepository: SettingsRepositoreable {
    func getAvailableFonts() -> [UIFont] {
        return settingsStorage.getAvailableFontsFamilies()
    }
    
    func getCurrentFont() -> UIFont {
        guard let currentFont = UIFont(name: currentFontFamily, size: CGFloat(currentFontSize)) else {
            return UIFont.systemFont(ofSize: CGFloat(currentFontSize), weight: .regular)
        }
        
        return currentFont
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
