//
//  SettingsStorage.swift
//  NovelReader
//
//  Created by Rafael Basso on 18/04/23.
//

import UIKit

class SettingsStorage {
    private let DEFAULT_FONT_FAMILY = "Helvetica"
    private let DEFAULT_FONT_SIZE: Float = 30.0
    private let AVAILABLE_FONT_FAMILY_NAMES = [
        "ArialMT",
        "Charter-Roman",
        "Helvetica",
        "Georgia",
        "Palatino-Roman",
        "Verdana",
        "TimesNewRomanPSMT"
    ]
    
    private let defaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.defaults = userDefaults
    }
}

extension SettingsStorage: SettingsStorable {
    func getAvailableFontsFamilies() -> [UIFont] {
        var availableUIFonts = [UIFont]()
        
        let fontSize = getFontSize()
        
        for name in AVAILABLE_FONT_FAMILY_NAMES {
            if let font = UIFont(name: name, size: CGFloat(fontSize)) {
                availableUIFonts.append(font)
            }
        }
        return availableUIFonts
    }
    
    func getFontFamily() -> String {
        let userDefaultsKey = "FontFamily"
        
        guard let savedFontFamily = defaults.string(forKey: userDefaultsKey) else {
            return DEFAULT_FONT_FAMILY
        }
        
        return savedFontFamily
    }
    
    func getFontSize() -> Float {
        let userDefaultsKey = "FontSize"
        
        guard let savedFontSize = defaults.string(forKey: userDefaultsKey) else {
            return DEFAULT_FONT_SIZE
        }
        
        guard let formattedNumber = NumberFormatter().number(from: savedFontSize) else {
            return DEFAULT_FONT_SIZE
        }
        
        return formattedNumber.floatValue
    }
    
    func setFontFamily(_ fontFamily: String) {
        defaults.set(fontFamily, forKey: "FontFamily")
    }
    
    func setFontSize(_ size: Float) {
        defaults.set(size, forKey: "FontSize")
    }
}
