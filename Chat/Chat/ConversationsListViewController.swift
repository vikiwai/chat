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

extension ConversationsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension ConversationsListViewController: UITableViewDelegate {
    
}
