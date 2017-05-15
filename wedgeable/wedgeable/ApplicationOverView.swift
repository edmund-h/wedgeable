//
//  ApplicationTimelineView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class ApplicationOverView: UIView, DetailView {
    
    @IBOutlet weak var positionCompanyDateLabel: UILabel!
    @IBOutlet weak var nextFollowUpDate: UILabel!
    @IBOutlet weak var goToLinkButton: UIButton!
    @IBOutlet weak var contactInfoStack: UIStackView!
    weak var application: Application!
    
    var preferredHeight: CGFloat? = 550
    
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
        contactInfoStack.layer.borderColor = UIColor.black.cgColor
        contactInfoStack.layer.cornerRadius = 8
        
    }
    
    
    
    
}
