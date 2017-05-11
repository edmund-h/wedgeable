//
//  ApplicationView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class ApplicationsView: UIView, InfoView {

    /*
     
     This will be a large view overviewing all applications you have submitted out so far. It will show how many reached certain milestones, statistics like applied vs responded and responded vs interviewed, and whether your weekly goal has been met
     
    */

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var applBreakdownView: UIView!
    @IBOutlet weak var applBreakdownLabel: UILabel!
    @IBOutlet weak var applOpenLabel: UILabel!
    @IBOutlet weak var applTotalLabel: UILabel!
    @IBOutlet weak var applNeedFollowup: UILabel!
    @IBOutlet weak var interviewBreakdown: UILabel!
    
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
        Bundle.main.loadNibNamed("ApplicationsView", owner: self, options: nil)
        
        contentView.addAndConstrainTo(view: self)
        self.backgroundColor = UIColor.slashBlue
        
        applBreakdownView.layer.cornerRadius = 8
        interviewBreakdown.layer.cornerRadius = 8
    }
}
