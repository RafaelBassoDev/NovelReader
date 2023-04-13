//
//  FontFamilySelectionView.swift
//  NovelReader
//
//  Created by Rafael Basso on 31/03/23.
//

import UIKit

class FontFamilySelectionViewController: UITableViewController {
    
    private weak var repository: SettingsRepositoreable?
    
    var fontOptions: [String]!
    
    init(fontOptions: [String] = [], repository: SettingsRepositoreable?) {
        self.fontOptions = [
            "SFPro",
            "Arial",
            "Comic Sans",
            "Times New York"
        ]
        self.repository = repository
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
        print("selected font: \(fontOptions[indexPath.row])")
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.selectionStyle = .gray
        
        let backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        cell.backgroundConfiguration = backgroundConfiguration
        
        let selectedFontName = fontOptions[indexPath.row]
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = selectedFontName
        contentConfiguration.textProperties.font = UIFont(name: selectedFontName, size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .regular)
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
