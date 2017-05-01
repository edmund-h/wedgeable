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
    
    var aspect: [Aspect]!
    var events: [Event] = [
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .blogposts ),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .applications),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .appointments),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .appointments),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .followups),
        Event(name: "lol", date: Date(timeIntervalSinceNow: 0), aspect: .followups)
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
        return aspect.count + events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row < aspect.count{
            let newCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            newCell.aspect = aspect[indexPath.row]
            cell = newCell
        } else {
            let newCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
            newCell.event = events[indexPath.row - aspect.count]
            cell = newCell
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
