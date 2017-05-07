//
//  TimelineViewController.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/7/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class TimelineViewController: UITableViewController {

    weak var event: Event!
    weak var timeline: Timeline!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let project = event as? Project {
            project.addCommits(date: Date(timeIntervalSinceNow: -749000.0), number: 1, description: "initial commit lol")
            project.addCommits(date: Date(timeIntervalSinceNow: -250000.0)  , number: 3, description: "made some commits yo")
            project.addCommits(date: Date(timeIntervalSinceNow: -500000.0), number: 3, description: "commits happened here")
            project.addCommits(date: Date(timeIntervalSinceNow: -10000.0), number: 3, description: "commits occurred")
            project.setNextGoal(ofType: .published, forDate: Date(timeIntervalSinceNow: 250000.0))
            project.changeTechnologies("Swift, CoreData, Google Sheets API, maybe gitHub")
            project.changeContributors("solo project")
            timeline = project.timeline
        }
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return getEntries().count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "overviewCell", for: indexPath) as! OverViewCell
            if let project = event as? Project {
                cell.overviewProject(project)
            } else if let appl = event as? Application {
                cell.overviewApplication(appl)
            }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "timelineCell", for: indexPath) as! TimelineCell
        cell.textLabel?.text = getEntries()[indexPath.row].description
        return cell
    }
    
    func getEntries()->[TimelineEntry]{
        return timeline.collection.values.flatMap({ $0.map({ $0 }) })
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
