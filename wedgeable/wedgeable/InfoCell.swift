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
    
    weak var infoView: InfoView?
    var aspect: Aspect? = nil {
        didSet {
            if let infoView = self.aspect?.getInfoView(),
                let view = infoView as? UIView{
                self.infoView = infoView
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
    
    func getPreferredHeight()-> CGFloat {
        if let height = self.infoView?.preferredHeight {
            return height
        }
        return 0
    }

}



protocol InfoView: class {
    var preferredHeight: CGFloat {get}
}
