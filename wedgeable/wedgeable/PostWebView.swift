//
//  PostWebView.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class PostWebView: UIView, DetailView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    
    var preferredHeight: CGFloat? = nil
    
    weak var post: BlogPost!
    
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
        Bundle.main.loadNibNamed("PostWebView", owner: self, options: nil)
        
        contentView.addAndConstrainTo(view: self)
        contentView.backgroundColor = UIColor.slashBlue
        
        //this should get called in loadEventData
        //setupStatusButton()
        
        webView.scalesPageToFit = true
    }
    
    func setupStatusButton(){
        switch post.status {
        case .planned:
            statusButton.titleLabel?.text = "Status: Planned             (Click to Change)"
        case .inProgress:
            statusButton.titleLabel?.text = "Status: In Progress             (Click to Change)"
        case .finished:
            guard let completedDate = post.datePublished else {return}
            statusButton.titleLabel?.text = "Completed: \(completedDate)"
        }
    }
    
    func loadPostURL(){
        guard let link = post.link else {return}
        let request = URLRequest(url: link)
        webView.loadRequest(request)
    }
    
    @IBAction func statusButtonClicked(){
        let notification = Notification(name: Notification.Name(rawValue: "ChangeBlogPostStatus"))
        NotificationCenter.default.post(notification)
    }
    
    //TODO: Implement this f(x) for this and all other detail/overViews
    //func loadEventData()
}
