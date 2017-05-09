//
//  ProjectTimelineView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class ProjectOverView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var addGoalBtn: UIButton!
    
    @IBOutlet weak var pictureStack: UIStackView!
    @IBOutlet weak var stackWidthConstr: NSLayoutConstraint!
    
    @IBOutlet weak var techsField: UITextView!
    @IBOutlet weak var contrbField: UITextView!
    
    weak var project: Project!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("ProjectOverView", owner: self, options: nil)
        
        contentView.addAndConstrainTo(view: self)
        contentView.backgroundColor = UIColor.wallGreen
        
        [addGoalBtn, techsField, contrbField].forEach({
            $0.layer.cornerRadius = 8
        })
    }
    
    @IBAction func newGoal(_ sender: UIButton) {
    }
    
    @IBAction func editTechs(_ sender: UIButton) {
    }
    
    @IBAction func editContrbs(_ sender: UIButton) {
    }
    
    @IBAction func addImage(_ sender: UIButton) {
    }
    
    func setupImages(){
        stackWidthConstr.constant = 650
        if project.images.count == 0 {
            for _ in 1...5 {
                let button = makeImageButton()
                button.setTitle("Add up to 5 screenshots of your project!", for: .normal)
                button.titleLabel?.numberOfLines = 0
                button.titleLabel?.lineBreakMode = .byWordWrapping
                button.backgroundColor = UIColor.slashBlue
                button.setTitleColor(UIColor.black, for: .normal)
            }
            return //will not fall through if this condition is met
        }
        // otherwise function will make buttons whose image is a thumbnail of each project screenshot
        project.images.forEach({ imageName in
            //get screenshot thumbnails from coreData
        })
    }
    
    private func makeImageButton()->UIButton{
        let btn = UIButton()
        pictureStack.addArrangedSubview(btn)
        return btn
    }
}
