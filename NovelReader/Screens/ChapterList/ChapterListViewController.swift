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
        super.init(nibName: nil, bundle: nil)
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell()

        cell.backgroundColor = .red
        
        return cell
    }
}
