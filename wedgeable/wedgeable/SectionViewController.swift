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
    var events: [Event] = [
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "loll", date: Date(timeIntervalSinceNow: 0), aspect: .blogposts ),
        Event(name: "lolll", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "llol", date: Date(timeIntervalSinceNow: 0), aspect: .applications),
        Event(name: "lllol", date: Date(timeIntervalSinceNow: 0), aspect: .appointments),
        Event(name: "lloll", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "lllolll", date: Date(timeIntervalSinceNow: 0), aspect: .appointments),
        Event(name: "loool", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "lolol", date: Date(timeIntervalSinceNow: 0), aspect: .followups)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        if indexPath.row == 0{
            let newCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            newCell.aspect = aspect
            cell = newCell
        } else {
            let newCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
            newCell.event = events[indexPath.row - 1]
            cell = newCell
        }

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

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
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
