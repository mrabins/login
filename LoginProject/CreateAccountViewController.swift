//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Mark Rabins on 8/25/15.
//  Copyright (c) 2015 self.swift. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func accountCreated ()
}

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var chooseUsernameTextField:  UITextField!
    @IBOutlet weak var choosePasswordTextField:  UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate:CreateAccountViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountButtonPressed (sender: UIButton) {
        
        println("\(choosePasswordTextField.text.isEmpty)")
        
        if choosePasswordTextField.text == confirmPasswordTextField.text && choosePasswordTextField.text != nil {
            
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUserNameKey)
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            delegate?.accountCreated()
            
        }
        else {
            var alertController = UIAlertController(title: "Error", message: "There was an error creating your account, please try again", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func cancelAccountButtonPressed (sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }


}
