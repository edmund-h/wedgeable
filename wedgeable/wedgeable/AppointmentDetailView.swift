//
//  AppointmentDetailView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class AppointmentDetailView: UIView, DetailView {
    
    
    weak var appointment: Appointment!
    
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
