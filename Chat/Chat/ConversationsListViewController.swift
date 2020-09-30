//
//  ConversationsListViewController.swift
//  Chat
//
//  Created by vikiwai on 30.09.2020.
//  Copyright © 2020 vikiwai. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController {
    
    @IBOutlet weak var conversationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conversationsTableView.dataSource = self
        conversationsTableView.delegate = self
    }
}

extension ConversationsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {        
        if section == 0 {
            return "Online"
        } else {
            return "History"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ConversationTableViewCell"
              
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversationTableViewCell else {
            fatalError("The dequeued cell is not an instance of LessonTableViewCell.")
        }
        
        cell.configure(with: ConversationCellModel(name: "Diana", message: "Hey!", date: "12.06.2020", isOnline: true, hasUnreadMessages: false))
        
        return cell
    }
}
