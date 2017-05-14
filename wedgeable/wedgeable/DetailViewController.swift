//
//  DetailViewController.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/11/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // This VC will grab an event that DOES NOT have subevents and display a full screen view of the event's details. It will determine the appropriate xib to load and know all the notifications to look for
    
    @IBOutlet weak var contentFrame: UIView!
    
    weak var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = event.name
        //get the view from xib
        let eventView = Aspect.getDetailView(forEvent: event)
        eventView.addAndConstrainTo(view: self.contentFrame)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
