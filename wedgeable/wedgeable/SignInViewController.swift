//
//  SignInViewController.swift
//  wedgeable
//
//  Created by Edmund Holderbaum on 8/31/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController {

    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
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

extension SignInViewController: GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        print ("dismiss")
    }
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        print ("present")
    }
}
