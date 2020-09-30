//
//  ConversationTableViewCell.swift
//  Chat
//
//  Created by vikiwai on 30.09.2020.
//  Copyright © 2020 vikiwai. All rights reserved.
//

import UIKit

protocol ConfigurableView {
    associatedtype ConfigurationModel
    
    func configure(with model: ConfigurationModel)
}

struct ConversationCellModel {
    let name: String
    let message: String
    let date: Bool
    let isOnline: Bool
    let hasUnreadMessages: Bool
}

class ConversationTableViewCell: UITableViewCell, ConfigurableView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    typealias ConfigurationModel = ConversationCellModel
    
    func configure(with model: ConversationCellModel) {
        nameLabel.text = model.name
        dateLabel.text = ""
        messageLabel.text = model.message
    }
}
