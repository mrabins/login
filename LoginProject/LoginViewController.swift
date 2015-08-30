//
//  LoginViewController.swift
//  LoginProject
//
//  Created by Mark Rabins on 8/25/15.
//  Copyright (c) 2015 self.swift. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, CreateAccountViewControllerDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginToCreateAccountSegue" {
            var createAccountVC = segue.destinationViewController as CreateAccountViewController
            createAccountVC.delegate = self
        }
    }
    
    
    @IBAction func loginButtonPressed(send: UIButton) {
        
        let usernameSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kUserNameKey) as String
        println(usernameSavedFromNSUserDefaults)
        let passwordSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPasswordKey) as String
        println(passwordSavedFromNSUserDefaults)
        
        if usernameTextField.text != usernameSavedFromNSUserDefaults || passwordTextField.text != passwordSavedFromNSUserDefaults {
            var alertController = UIAlertController(title: "Error", message: "Username and Password do not match our records, please try again", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            self.performSegueWithIdentifier("loginToMainSegue", sender: self)

        }
        

        
      
        
    }
    @IBAction func createAccountButtonPressed(send: UIButton) {
        self.performSegueWithIdentifier("loginToCreateAccountSegue", sender: self)
        
    }
    
    // CreateAccountViewControllerDelegate
    
    func accountCreated() {
        self.performSegueWithIdentifier("loginToMainSegue", sender: nil)
    }
    

}
