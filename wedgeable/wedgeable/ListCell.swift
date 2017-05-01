//
//  ListCell.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var event: Event? = nil {
        didSet {
            //this is to test what kind of logic these cells will use once we are actually using data
            self.textLabel?.text = event?.name
            if let event = event, event.aspect == .followups {
                self.backgroundColor = UIColor.magenta
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
