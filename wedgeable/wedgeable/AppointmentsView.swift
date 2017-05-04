//
//  AppointmentView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class AppointmentsView: UIView, InfoView {

    /*
     
     This will be a large view overviewing all your appointments. It will show a breakdown of all the types of job search relevant meetups, interviews, catchups etc you have completed. It will also show your next scheduled meeting with your career coach and whether your weekly goals have been met 
     
    */
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var complSchedWeekContainer: UIView!
    @IBOutlet weak var complSchedAllContainer: UIView!
    @IBOutlet weak var typeBreakdownContainer: UIView!
    
    @IBOutlet weak var complSchedWeekLabel: UILabel!
    @IBOutlet weak var complSchedAllLabel: UILabel!
    @IBOutlet weak var typeBreakdownLabel: UILabel!
    @IBOutlet weak var nextAdvisor: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("AppointmentsView", owner: self, options: nil)
        
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = false
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = false
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = false
    }
    
    func formatSelf() {
        self.backgroundColor = UIColor.wallGreen
    }
}
