//
//  ProjectView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class ProjectsView: UIView, InfoView {

    /*
     
     This will be a large view with an overview of all the projects you are currently working on, how many commits you have made in the past, how many this week, how close you are to your weekly requirements and goals
     
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var projByStageView: UIView!
    @IBOutlet weak var projByCommitsView: UIView!
    @IBOutlet weak var weeklyCommitsView: UIView!
    @IBOutlet weak var projByStageLabel: UILabel!
    @IBOutlet weak var projByCommitsLabel: UILabel!
    @IBOutlet weak var weeklyCommitsLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var nextGoalLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("ProjectsView", owner: self, options: nil)
        
        contentView.addAndConstrainTo(view: self)
        contentView.backgroundColor = UIColor.wallGreen
    }
}
