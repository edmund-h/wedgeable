//
//  InfoCell.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import Foundation

class InfoCell: UITableViewCell {
    
    var aspect: Aspect? = nil {
        didSet {
            let view = self.aspect?.getAspectView()
            view?.addAndConstrainTo(view: self.contentView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



protocol InfoView {
    func formatSelf()
}

extension InfoView {
    func addAndConstrainTo(view: UIView) {
        let me = self as! UIView
        view.addSubview(me)
        me.translatesAutoresizingMaskIntoConstraints = false
        me.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        me.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        me.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        me.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.formatSelf()
    }
}
