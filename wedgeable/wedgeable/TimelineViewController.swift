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
    var infoCellHeight: CGFloat = 0
    
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeline.count + 1
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
        cell.textLabel?.text = timeline.getEntry(indexPath.row - 1).description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat( event.aspect.getXibHeight() )
        }
        return self.view.bounds.height * (1.0/12.0)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? DetailViewController,
            let sender = sender as? TimelineCell,
            let event = sender.item as? Event else {
                print("could not translate item to event")
                return}
        dest.event = event
    }

}
