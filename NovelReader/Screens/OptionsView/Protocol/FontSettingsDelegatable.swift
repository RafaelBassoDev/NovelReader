//
//  FontSettingsDelegatable.swift
//  NovelReader
//
//  Created by Rafael Basso on 14/04/23.
//

import Foundation

protocol FontSettingsDelegatable {
    var settingsDelegate: FontSettingsSelectionDelegate? { get set }
}
