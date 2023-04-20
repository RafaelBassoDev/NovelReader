//
//  OptionsViewController.swift
//  NovelReader
//
//  Created by Rafael Basso on 30/03/23.
//

import UIKit

class SettingsViewController: UITableViewController {

    private enum FontSettings: Int, CaseIterable {
        case fontFamily
        case fontSize
        
        static var count: Int {
            Self.allCases.count
        }
        
        static subscript(indexPath: IndexPath) -> FontSettings? {
            return FontSettings(rawValue: indexPath.row)
        }
        
        func getStringDescription() -> String {
            switch self {
            case .fontFamily:
                return "Font Family"
            case .fontSize:
                return "Font Size"
            }
        }
    }
    
    private var repository: SettingsRepositoreable!
    
    init(repository: SettingsRepositoreable) {
        self.repository = repository
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension SettingsViewController: FontSettingsSelectionDelegate {
    func didSetFontSize(to newSize: Float) {
        repository.setFontSize(newSize)
    }
    
    func didSetFontFamily(to fontFamily: String) {
        repository.setFontFamily(fontFamily)
    }
}

extension SettingsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSettings.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController: UIViewController!
        
        guard let setting = FontSettings[indexPath] else {
            return
        }
        
        switch setting {
        case .fontFamily:
            let fontFamilies = repository.getAvailableFonts()
            let currentFont = repository.getCurrentFont()
            let controller = FontFamilySelectionViewController(fontFamilyOptions: fontFamilies, currentFont: currentFont)
            controller.settingsDelegate = self
            viewController = controller
        case .fontSize:
            let currentFont = repository.getCurrentFont()
            let controller = FontSizeSelectionViewController(font: currentFont)
            controller.settingsDelegate = self
            viewController = controller
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.selectionStyle = .gray
        cell.accessoryType = .disclosureIndicator
        
        let backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        cell.backgroundConfiguration = backgroundConfiguration
        
        var contentConfiguration = cell.defaultContentConfiguration()
        
        let settingTitle = FontSettings[indexPath]?.getStringDescription() ?? ""
        contentConfiguration.text = settingTitle
        
        contentConfiguration.textProperties.font = UIFont.boldSystemFont(ofSize: 20)
        contentConfiguration.textProperties.lineBreakMode = .byTruncatingTail
        contentConfiguration.textProperties.numberOfLines = 2
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
