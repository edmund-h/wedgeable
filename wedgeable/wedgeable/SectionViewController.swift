//
//  SectionViewController.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/1/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class SectionViewController: UITableViewController {

    //This will be the view controller that displays an infoView about a certain aspect of the job search and a number of cells refering to single tasks and/or events related to it. For the profile, it will display the profile infoView as well as all other infoViews
    //a button in the upper right corner will allow the user to add a new task/event. on the profile view, this will be the button to edit your profile
    
    var aspect: Aspect!
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.events = aspect.getTestData()
        navigationController?.title = aspect.rawValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //should be number of infoviews+number of sub-events to display
        return 1 + events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let index = indexPath.row
        if  index == 0{
            let newCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            newCell.aspect = aspect
            cell = newCell
        //the first cell here is always going to be an infoView displaying an overview of all entries in this category
        } else {
        //all the other cells are going to be one of two types of EventCell depending on whether there will be sub-entries to display in next VC
            var identifier = "timelineEventCell"
            if events[index - 1] is TimelineEntry { identifier = "detailEventCell" }
            let newCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ListCell
            newCell.event = events[indexPath.row - 1]
            cell = newCell
        }//timeline => timelineVC, detail => detailVC
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.bounds.height * 0.5
        }
        return self.view.bounds.height / 12
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0 {
            return false
        }
        return true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let sender = sender as! ListCell
        if sender.event == nil {return false}
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let sender = sender as! ListCell
            destination.event = sender.event
        }//this is not DRY. protocol?
        if let destination = segue.destination as? TimelineViewController {
            let sender = sender as! ListCell
            destination.event = sender.event
        }
        
    }
    
}
