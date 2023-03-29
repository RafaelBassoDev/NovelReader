//
//  ChapterListViewController.swift
//  NovelReader
//
//  Created by Rafael Basso on 29/03/23.
//

import UIKit

class ChapterListViewController: UITableViewController, Coordinatable {
    weak var coordinator: Coordinator?
    let chapters: [Chapter]!
    
    init(chapters: [Chapter]) {
        self.chapters = chapters
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        self.chapters = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}

extension ChapterListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.cornerRadius = 10
        backgroundConfiguration.backgroundInsets = NSDirectionalEdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0)
        cell.backgroundConfiguration = backgroundConfiguration
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = chapters[indexPath.row].title
        contentConfiguration.textProperties.font = UIFont.boldSystemFont(ofSize: 20)
        contentConfiguration.textProperties.lineBreakMode = .byTruncatingTail
        contentConfiguration.textProperties.numberOfLines = 2
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
