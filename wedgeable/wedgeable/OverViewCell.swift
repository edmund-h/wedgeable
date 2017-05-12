//
//  OverViewCell.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class OverViewCell: UITableViewCell {
    
    enum Aspect { case application(Application), project(Project) }
    
    var aspect: Aspect? = nil{
        didSet {
            guard let aspect = aspect else {
                self.subviews.forEach({
                    $0.removeFromSuperview()
                })
                return
            }
            switch aspect {
            case .application(let myApp):
                let view = ApplicationOverView()
                view.application = myApp
                view.addAndConstrainTo(view: self.contentView)
            case .project(let myProj):
                let view = ProjectOverView()
                print ("passing " + myProj.title + " to view")
                view.project = myProj
                view.addAndConstrainTo(view: self.contentView)
                view.setupImages()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func overviewApplication(_ myApp: Application) {
        self.aspect = Aspect.application(myApp)
    }
    
    func overviewProject(_ myProj: Project) {
        print("adding " + myProj.title + " to enum")
        self.aspect = Aspect.project(myProj)
    }
    
    func getPreferredHeight()-> CGFloat?{
        if let view = self.contentView as? DetailView{
            return view.preferredHeight
        }
        return nil
    }
}

protocol DetailView {
    var preferredHeight: CGFloat? {get}
}
