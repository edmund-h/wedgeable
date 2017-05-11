//
//  MainViewController.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier else {return}
        let dest = segue.destination as! SectionViewController
        switch id {
        case "applicationSegue":
            dest.aspect = .applications
        case "appointmentSegue":
            dest.aspect = .appointments
        case "contactSegue":
            dest.aspect = .contacts
        case "followUpSegue":
            dest.aspect = .followups
        case "projectSegue":
            dest.aspect = .projects
        case "blogSegue":
            dest.aspect = .blogposts
//        case "profileSegue":
//            return
        default:
            NSLog("%@", "MainView segue with bad identifier!")
            return
        }
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // TODO: Put together a function that displays all upcoming events within the next 7 days
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var events = [TimelineEntry]()
        Aspect.all.forEach({
            let stuff = $0.getTestData()
            if let things = stuff as? [TimelineEntry] {
                events.append(contentsOf: things)
            }
        })
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! ListCell
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //this will be the "upcoming events" view which will contain cells for each event in the upcoming 7 days.
    }
    
}
