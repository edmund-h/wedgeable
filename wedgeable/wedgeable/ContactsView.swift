//
//  ContactView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class ContactsView: UIView, InfoView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var newContactBtn: UIButton!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var mostValuableLabel: UILabel!
    @IBOutlet weak var needsFollowUpLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("ContactsView", owner: self, options: nil)
        contentView.addAndConstrainTo(view: self)
        contentView.backgroundColor = UIColor.slashBlue
        newContactBtn.layer.cornerRadius = 18
    }
    
    func formatSelf() {
        self.backgroundColor = UIColor.cyan
    }
    
    @IBAction func newContact(_ sender: UIButton) {
        //this will go to a special quick-add sequence that uses a uialert to add a new contact name and info, followed by another to add the place met
    }

}
