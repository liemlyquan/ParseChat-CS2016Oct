//
//  MessageTableViewCell.swift
//  ParseChat
//
//  Created by Pj Nguyen on 10/26/16.
//  Copyright © 2016 coderschool. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var userLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
