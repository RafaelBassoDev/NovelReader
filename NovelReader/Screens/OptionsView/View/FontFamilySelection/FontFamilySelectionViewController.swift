//
//  FontFamilySelectionView.swift
//  NovelReader
//
//  Created by Rafael Basso on 31/03/23.
//

import UIKit

class FontFamilySelectionViewController: UITableViewController, FontSettingsDelegatable {
    weak var settingsDelegate: FontSettingsSelectionDelegate?
    
    var fontOptions: [UIFont]!
    var selectedFont: UIFont!
    
    init(fontFamilyOptions: [UIFont], currentFont: UIFont) {
        self.fontOptions = fontFamilyOptions
        self.selectedFont = currentFont
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension FontFamilySelectionViewController {
    private func isSelectedFont(_ font: UIFont) -> Bool {
        return font.familyName == selectedFont.familyName
    }
    
    private func setSelectedFont(_ font: UIFont) {
        self.selectedFont = font
        settingsDelegate?.didSetFontFamily(to: selectedFont.familyName)
        tableView.reloadData()
    }
}

extension FontFamilySelectionViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontOptions.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clickedFont = fontOptions[indexPath.row]
        setSelectedFont(clickedFont)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let currentFont = fontOptions[indexPath.row].withSize(24)
        
        if isSelectedFont(currentFont) {
            cell.accessoryType = .checkmark
        }
        
        let backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        cell.backgroundConfiguration = backgroundConfiguration
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = currentFont.familyName
        contentConfiguration.textProperties.font = currentFont
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
