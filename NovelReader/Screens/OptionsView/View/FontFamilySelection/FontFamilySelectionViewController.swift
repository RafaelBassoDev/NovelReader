//
//  FontFamilySelectionView.swift
//  NovelReader
//
//  Created by Rafael Basso on 31/03/23.
//

import UIKit

class FontFamilySelectionViewController: UITableViewController, FontSettingsDelegatable {
    weak var settingsDelegate: FontSettingsSelectionDelegate?
    
    var fontOptions: [String]!
    
    init(fontFamilyOptions: [String]) {
        self.fontOptions = fontFamilyOptions
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFontFamily = fontOptions[indexPath.row]
        settingsDelegate?.didSetFontFamily(to: selectedFontFamily)
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.selectionStyle = .gray
        
        let backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        cell.backgroundConfiguration = backgroundConfiguration
        
        let currentFontName = fontOptions[indexPath.row]
        let currentUIFont = UIFont(name: currentFontName, size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .regular)
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = currentFontName
        contentConfiguration.textProperties.font = currentUIFont
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
