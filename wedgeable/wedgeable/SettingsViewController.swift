//
//  SettingsViewController.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 5/3/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import GoogleSignIn

class SettingsViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var startPicker: UIDatePicker!
    @IBOutlet weak var endPicker: UIDatePicker!
    @IBOutlet weak var googleField: UITextField!
    @IBOutlet weak var doneButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 9
        let data = UserDefaults.standard
        if let name = data.string(forKey: "name") {
            let startIntrvl = data.double(forKey: "start")
            let endIntrvl = data.double(forKey: "end")
            nameField.text = name
            startPicker.date = Date(timeIntervalSince1970: startIntrvl)
            endPicker.date = Date(timeIntervalSince1970: endIntrvl)
        } else if let user = GIDSignIn.sharedInstance().currentUser {
            nameField.text = user.profile.name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        guard let name = nameField.text else {return}
        let sDate = startPicker.date
        let eDate = endPicker.date
        Profile.setCriticalUserData(name: name, start: sDate, end: eDate)
        if let text = googleField.text{
            _ = Profile.setUrl(text, forService: .sheets)
        }
        navigationController?.popViewController(animated: true)
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
