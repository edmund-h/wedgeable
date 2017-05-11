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
            if let view = self.aspect?.getInfoView() as? UIView{
                view.addAndConstrainTo(view: self.contentView)
            }
            if aspect ==  nil {
                self.contentView.subviews.forEach({
                    $0.removeFromSuperview()
                })
            }
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
    var preferredHeight: CGFloat {get}
}
