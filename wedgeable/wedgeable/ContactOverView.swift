//
//  ContactDetailView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class ContactOverView: UIView, DetailView {

    weak var contact: Contact!
    
    @IBOutlet weak var stackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var contactInfoStackView: UIStackView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var dateMetLabel: UILabel!
    @IBOutlet weak var metAtLabel: UILabel!
    @IBOutlet weak var timesContactedLabel: UILabel!
    @IBOutlet weak var needsFollowUpLabel: UILabel!
    
    var preferredHeight: CGFloat? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        // DO NOT ASSIGN EVENT PROPERTIES TO VIEWS IN COMMON INIT
        
    }
}
