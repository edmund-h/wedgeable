//
//  AppointmentDetailView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class AppointmentDetailView: UIView, DetailView {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var beginDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var contactInfoStack: UIStackView!
    @IBOutlet weak var markCompleteButton: UIButton!
    // the idea is that the completedView will remain hidden until marked complete, then the markCompleteButton will be hidden behind the view.
    @IBOutlet weak var completedView: UIView!
    @IBOutlet weak var needsFollowUpLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!
    
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
