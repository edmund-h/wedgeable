//
//  FollowUpView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class FollowUpsView: UIView, InfoView {

    /*
     
     This will be a large view overviewing your record with followups: how many you have done, how quickly you follow up, how many you have sent late, etc
     
    */
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var dueTodayLabel: UILabel!
    @IBOutlet weak var overdueLabel: UILabel!
    @IBOutlet weak var leftWarningImg: UIImageView!
    @IBOutlet weak var rightWarningImg: UIImageView!
    @IBOutlet weak var neededByTypeView: UIView!
    @IBOutlet weak var neededByTypeLabel: UILabel!
    @IBOutlet weak var ontimeRatioView: UIView!
    @IBOutlet weak var onTimeRatioLabel: UILabel!
    @IBOutlet weak var avgTimeLabel: UILabel!
    
    var preferredHeight: CGFloat = 330
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("FollowUpsView", owner: self, options: nil)
        contentView.addAndConstrainTo(view: self)
        contentView.backgroundColor = UIColor.slashBlue
        ontimeRatioView.layer.cornerRadius = 8
        neededByTypeView.layer.cornerRadius = 8
    }
    
    func formatSelf() {
        self.backgroundColor = UIColor.red
    }
}
