//
//  SettingsRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

class SettingsRepository: SettingsRepositoreable {
    
    private let DEFAULT_FONT_FAMILY = "SFPro"
    private let DEFAULT_FONT_SIZE: Float = 30.0
    
    private let defaults = UserDefaults.standard
    
    private var availableFontFamilies = [
        "SFPro",
        "Arial",
        "Comic Sans",
        "Times New York"
    ]
    
    var currentFontFamily: String!
    var currentFontSize: Float!
    
    init() {
        currentFontFamily = getStoredFontFamily()
        currentFontSize = getStoredFontSize()
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
            setStoredFontSize(size)
        }
    }
    
    func setFontFamily(_ fontFamily: String) {
        if fontFamily != currentFontFamily {
            currentFontFamily = fontFamily
            setStoredFontFamily(fontFamily)
        }
    }
}

extension SettingsRepository {
    private func getStoredFontFamily() -> String {
        let userDefaultsKey = "FontFamily"
        
        guard let savedFontFamily = defaults.string(forKey: userDefaultsKey) else {
            return DEFAULT_FONT_FAMILY
        }
        
        return savedFontFamily
    }
    
    private func getStoredFontSize() -> Float {
        let userDefaultsKey = "FontSize"
        
        guard let savedFontSize = defaults.string(forKey: userDefaultsKey) else {
            return DEFAULT_FONT_SIZE
        }
        
        guard let formattedNumber = NumberFormatter().number(from: savedFontSize) else {
            return DEFAULT_FONT_SIZE
        }
        
        return formattedNumber.floatValue
    }
    
    private func setStoredFontFamily(_ fontFamily: String) {
        defaults.set(fontFamily, forKey: "FontFamily")
    }
    
    private func setStoredFontSize(_ size: Float) {
        defaults.set(size, forKey: "FontSize")
    }
}
