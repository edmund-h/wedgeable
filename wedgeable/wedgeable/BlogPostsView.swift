//
//  BlogPostView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class BlogPostsView: UIView, InfoView {

    /*
     
    This will be a large view with information about the different blog posts you have made, when the next ones are due, how many deadlines you have met/missed
     
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var numPostsLabel: UILabel!
    @IBOutlet weak var numDraftsLabel: UILabel!
    @IBOutlet weak var nextPostLabel: UILabel!
    @IBOutlet weak var breakdownView: UIView!
    @IBOutlet weak var breakdownLabel: UILabel!
    @IBOutlet weak var missingLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("BlogPostsView", owner: self, options: nil)
        contentView.addAndConstrainTo(view: self)
        contentView.backgroundColor = UIColor.slashBlue
        breakdownView.layer.cornerRadius = 8
    }
    
    func formatSelf() {
    }
}
