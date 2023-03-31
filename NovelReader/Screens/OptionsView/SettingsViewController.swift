//
//  OptionsViewController.swift
//  NovelReader
//
//  Created by Rafael Basso on 30/03/23.
//

import UIKit

class SettingsViewController: UITableViewController {

    private enum FontSettings: String, CaseIterable {
        case fontFamily = "Font Family"
        case fontSize = "Font Size"
    }
    
    private let options: [FontSettings] = [
        .fontFamily,
        .fontSize
    ]
    
    init() {
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension SettingsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch options[indexPath.row] {
        case .fontFamily:
            let viewController = FontFamilySelectionViewController()
            navigationController?.pushViewController(viewController, animated: true)
            
        case .fontSize:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.selectionStyle = .gray
        cell.accessoryType = .disclosureIndicator
        
        let backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        cell.backgroundConfiguration = backgroundConfiguration
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = options[indexPath.row].rawValue
        contentConfiguration.textProperties.font = UIFont.boldSystemFont(ofSize: 20)
        contentConfiguration.textProperties.lineBreakMode = .byTruncatingTail
        contentConfiguration.textProperties.numberOfLines = 2
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
