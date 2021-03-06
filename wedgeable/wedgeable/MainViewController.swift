//
//  MainViewController.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 4/29/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class MainViewController: UIViewController {
    
    var events = Timeline()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Aspect.all.forEach({
            let stuff = $0.getTestData()
            print (stuff.description)
            if let things = stuff as? [TimelineEntry] {
                events.append(things)
            }
        })
        
        if GIDSignIn.sharedInstance().currentUser == nil {
            let signInVC = SignInViewController(
                nibName: "SignInViewController",
                bundle: Bundle.main
            )
            present(signInVC, animated: false, completion: nil)
            let complete = Notification.Name.init("SignInComplete")
            NotificationCenter.default.addObserver(self, selector: #selector(pushSettingsVC) , name: complete, object: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier,
        let dest = segue.destination as? SectionViewController else {return}
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
        case "detailSegue": break
            /*if let selectedRow = tableView.indexPathForSelectedRow?.row{
                let detail = segue.destination as! DetailViewController
                //todo: load event based on timeline entry
                
            }*/
        default:
            NSLog("%@", "MainView segue with bad identifier!")
            return
        }
    }
    
    func pushSettingsVC(){
        performSegue(withIdentifier: "settingsSegue", sender: nil)
        let complete = Notification.Name.init("SignInComplete")
        NotificationCenter.default.removeObserver(self, name: complete, object: nil)
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    // TODO: Put together a function that displays all upcoming events within the next 7 days
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! TimelineCell
        cell.textLabel?.text = "\(events.getEntry(indexPath.row).description)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //this will be the "upcoming events" view which will contain cells for each event in the upcoming 7 days.
    }
    
}
