//
//  SettingsRepository.swift
//  NovelReader
//
//  Created by Rafael Basso on 13/04/23.
//

import UIKit

class SettingsRepository: SettingsRepositoreable {
    
    private let DEFAULT_FONT_FAMILY = "SFPro"
    
    private var availableFontFamilies = [
        "SFPro",
        "Arial",
        "Comic Sans",
        "Times New York"
    ]
    
    var currentFontFamily: String
    var currentFontSize: Float
    
    init() {
        currentFontFamily = ""
        currentFontSize = 12
    }
    
    func getAvailableFontFamilyNames() -> [String] {
        return availableFontFamilies
    }
    
    func getLatestUIFontSettings() -> UIFont {
        return UIFont.systemFont(ofSize: CGFloat.random(in: 12...60), weight: .regular)
    }
}

extension SettingsRepository {
    private func getStoredFontFamily() -> String {
        return DEFAULT_FONT_FAMILY
    }
    
    private func getStoredFontSizer() -> Float {
        return 0.0
    }
}
